-- TRIGGER PARA IMPLEMENTAR AS CONSTRAINTS IC-1 E IC-2

CREATE OR REPLACE FUNCTION check_V()
RETURNS TRIGGER AS
$$
BEGIN
    IF ( ((SELECT voltage FROM busbar WHERE id = NEW.pbbid) = NEW.pv)
            AND
            ((SELECT voltage FROM busbar WHERE id = NEW.sbbid) = NEW.sv))
        THEN RETURN NEW;
    ELSE
        RAISE EXCEPTION 'Transformer and Busbar voltage values dont match';
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_Voltages
BEFORE INSERT OR UPDATE ON transformer
FOR EACH ROW EXECUTE PROCEDURE check_V();



-- TRIGGER PARA IMPLEMENTAR A CONSTRAINT IC-5

CREATE OR REPLACE FUNCTION check_A()
RETURNS TRIGGER AS
$$
BEGIN
    IF('T' != (SELECT SUBSTRING (NEW.id, 1, 1)) ) THEN RETURN NEW;
    END IF;
    IF( (SELECT (s.sname, s.saddress)
         FROM transformer t NATURAL JOIN substation s
         WHERE (t.id = NEW.id) ) != (NEW.name,NEW.address)) THEN RETURN NEW;
    ELSE
          RAISE EXCEPTION 'A person cant analyse an incident that occurred in a transformer located in a substation they supervise';
    END IF;

END
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_Analyses
BEFORE INSERT OR UPDATE ON analyses
FOR EACH ROW EXECUTE PROCEDURE check_A();
