-- popular tabela Person -------------------
INSERT INTO Person VALUES('Raimundo Passos', '5200-28, Norte, Distrito de Bragança, Mogadouro', '922555470', 'SO1M3TXKY6');
INSERT INTO Person VALUES('Cosme Alves', '4960-095, Norte, Viana do Castelo, Melgaco, Podre', '915552302', '3X3XKG4RRJ');
INSERT INTO Person VALUES('Bento Siqueira', '5470-333, Norte, Vila Real, Montalegre', '921555959', 'L21MR5MCHM');
INSERT INTO Person VALUES('Narciso Mascarenhas', '3230-274, Centro, Coimbra, Penela', '921555922', 'FYKR1XPUEW');
INSERT INTO Person VALUES('Marciano Macedo', '5360-492, Norte, Distrito de Bragança, Vila Flor, Vieiro', '965555928', 'H14INQF0LY');
INSERT INTO Person VALUES('Lia Castro', '7900-236, Beja, Ferreira do Alentejo, Figueira dos Cavaleiros', '935558043', '2JWBG86ECX');
INSERT INTO Person VALUES('Lia Castro', '7630-013, Beja, Odemira, Vale de Bispo', '929155589', 'MJ56IB69I6');
INSERT INTO Person VALUES('Lia Castro', '4540-264, Norte, Aveiro, Vale de Cambra, Roge', '965554570', 'EBSK5TCRYY');
INSERT INTO Person VALUES('Thalita Torres', '3350-207, Centro, Coimbra, Arganil, Pombeiro da Beira', '921555365', 'LP5BWJ2063');
INSERT INTO Person VALUES('Clementina Nunes', '7655-812, Beja, Odemira, Santa Clara-a-Velha', '922555819', 'CEBGVADIMI');
INSERT INTO Person VALUES('Serafina Caetano', '7800-814, Beja, Ferreira do Alentejo', '929155592', 'YNNQAAQYL9');


-- popular tabela Supervisor -------------------
INSERT INTO Supervisor VALUES('Cosme Alves', '4960-095, Norte, Viana do Castelo, Melgaco, Podre');
INSERT INTO Supervisor VALUES('Bento Siqueira', '5470-333, Norte, Vila Real, Montalegre');
INSERT INTO Supervisor VALUES('Narciso Mascarenhas', '3230-274, Centro, Coimbra, Penela');
INSERT INTO Supervisor VALUES('Marciano Macedo', '5360-492, Norte, Distrito de Bragança, Vila Flor, Vieiro');
INSERT INTO Supervisor VALUES('Lia Castro', '7900-236, Beja, Ferreira do Alentejo, Figueira dos Cavaleiros');
INSERT INTO Supervisor VALUES('Thalita Torres', '3350-207, Centro, Coimbra, Arganil, Pombeiro da Beira');
INSERT INTO Supervisor VALUES('Clementina Nunes', '7655-812, Beja, Odemira, Santa Clara-a-Velha');
INSERT INTO Supervisor VALUES('Serafina Caetano', '7800-814, Beja, Ferreira do Alentejo');
INSERT INTO Supervisor VALUES('Lia Castro', '7630-013, Beja, Odemira, Vale de Bispo');

-- popular tabela Analyst -------------------
INSERT INTO Analyst VALUES('Raimundo Passos', '5200-28, Norte, Distrito de Bragança, Mogadouro');
INSERT INTO Analyst VALUES('Cosme Alves', '4960-095, Norte, Viana do Castelo, Melgaco, Podre');
INSERT INTO Analyst VALUES('Bento Siqueira', '5470-333, Norte, Vila Real, Montalegre');
INSERT INTO Analyst VALUES('Marciano Macedo', '5360-492, Norte, Distrito de Bragança, Vila Flor, Vieiro');
INSERT INTO Analyst VALUES('Lia Castro', '7900-236, Beja, Ferreira do Alentejo, Figueira dos Cavaleiros');
INSERT INTO Analyst VALUES('Lia Castro', '7630-013, Beja, Odemira, Vale de Bispo');
INSERT INTO Analyst VALUES('Lia Castro', '4540-264, Norte, Aveiro, Vale de Cambra, Roge');
INSERT INTO Analyst VALUES('Thalita Torres', '3350-207, Centro, Coimbra, Arganil, Pombeiro da Beira');
INSERT INTO Analyst VALUES('Serafina Caetano', '7800-814, Beja, Ferreira do Alentejo');

-- popular tabela Element -------------------
INSERT INTO Element VALUES('B-240');-- BUS BAR
INSERT INTO Element VALUES('B-055');-- BUS BAR
INSERT INTO Element VALUES('T-356');-- TRANSFORMER
INSERT INTO Element VALUES('B-083');-- BUS BAR
INSERT INTO Element VALUES('B-735');-- BUS BAR
INSERT INTO Element VALUES('T-053');-- TRANSFORMER
INSERT INTO Element VALUES('B-181');-- BUS BAR
INSERT INTO Element VALUES('T-329');-- TRANSFORMER
INSERT INTO Element VALUES('B-220');-- BUS BAR
INSERT INTO Element VALUES('T-135');-- TRANSFORMER
INSERT INTO Element VALUES('B-078');-- BUS BAR
INSERT INTO Element VALUES('B-789');-- BUS BAR
INSERT INTO Element VALUES('L-693');-- LINE
INSERT INTO Element VALUES('L-725');-- LINE
INSERT INTO Element VALUES('T-741');-- TRANSFORMER
INSERT INTO Element VALUES('T-617');-- TRANSFORMER
INSERT INTO Element VALUES('L-056');-- LINE
INSERT INTO Element VALUES('B-346');-- BUS BAR
INSERT INTO Element VALUES('B-907');-- BUS BAR
INSERT INTO Element VALUES('T-889');-- TRANSFORMER
INSERT INTO Element VALUES('B-712');-- BUS BAR
INSERT INTO Element VALUES('B-342');-- BUS BAR
INSERT INTO Element VALUES('L-704');-- LINE
INSERT INTO Element VALUES('L-454');-- LINE
INSERT INTO Element VALUES('L-281');-- LINE
INSERT INTO Element VALUES('B-462');-- BUS BAR
INSERT INTO Element VALUES('L-623');-- LINE
INSERT INTO Element VALUES('L-651');-- LINE
INSERT INTO Element VALUES('L-580');-- LINE
INSERT INTO Element VALUES('L-461');-- LINE
INSERT INTO Element VALUES('L-012');-- LINE
INSERT INTO Element VALUES('L-112');-- LINE
INSERT INTO Element VALUES('T-116');-- TRANSFORMER
INSERT INTO Element VALUES('T-380');-- TRANSFORMER
INSERT INTO Element VALUES('T-002');-- TRANSFORMER
INSERT INTO Element VALUES('T-555');-- TRANSFORMER
INSERT INTO Element VALUES('T-005');-- TRANSFORMER
INSERT INTO Element VALUES('T-610');-- TRANSFORMER
INSERT INTO Element VALUES('T-541');-- TRANSFORMER
INSERT INTO Element VALUES('T-301');-- TRANSFORMER

-- popular tabela Incident -------------------
INSERT INTO Incident VALUES('T-356', '2020-10-19 10:23:31', 'Erro A', 'Muito Grave');
INSERT INTO Incident VALUES('T-617', '2020-10-19 11:51:28', 'Erro D', 'Grave');
INSERT INTO Incident VALUES('B-735', '2020-10-19 11:22:54', 'Erro C', 'Pouco Grave');
INSERT INTO Incident VALUES('B-789', '2020-10-19 12:23:34', 'Erro B', 'Não Grave');
INSERT INTO Incident VALUES('T-741', '2020-10-19 13:44:56', 'Erro B', 'Não Grave');
INSERT INTO Incident VALUES('B-789', '2020-10-19 14:31:51', 'Erro C', 'Pouco Grave');
INSERT INTO Incident VALUES('B-240', '2020-10-19 15:59:23', 'Erro C', 'Pouco Grave');
INSERT INTO Incident VALUES('L-056', '2020-10-19 16:45:54', 'Erro D', 'Grave');
INSERT INTO Incident VALUES('B-789', '2020-10-19 17:22:00', 'Erro C', 'Pouco Grave');
INSERT INTO Incident VALUES('L-056', '2020-10-19 18:12:54', 'Erro B', 'Não Grave');
INSERT INTO Incident VALUES('L-693', '2020-10-19 18:42:54', 'Erro B', 'Não Grave');
INSERT INTO Incident VALUES('B-789', '2020-10-19 22:23:54', 'Erro A', 'Muito Grave');
INSERT INTO Incident VALUES('T-053', '2020-10-19 23:13:14', 'Erro D', 'Grave');
INSERT INTO Incident VALUES('L-725', '2020-10-19 23:50:09', 'Erro B', 'Não Grave');
INSERT INTO Incident VALUES('T-053', '2020-10-20 00:23:50', 'Erro F', 'Não Grave');
INSERT INTO Incident VALUES('B-789', '2020-10-20 01:44:04', 'Erro F', 'Não Grave');
INSERT INTO Incident VALUES('B-735', '2020-10-20 02:33:41', 'Erro A', 'Muito Grave');
INSERT INTO Incident VALUES('B-789', '2020-10-20 02:43:22', 'Erro C', 'Pouco Grave');
INSERT INTO Incident VALUES('L-056', '2020-10-20 02:55:43', 'Erro C', 'Pouco Grave');
INSERT INTO Incident VALUES('L-725', '2020-10-20 04:04:54', 'Erro D', 'Grave');
INSERT INTO Incident VALUES('L-693', '2020-10-20 07:28:55', 'Erro C', 'Pouco Grave');
INSERT INTO Incident VALUES('L-056', '2020-10-20 09:00:00', 'Erro B', 'Não Grave');
INSERT INTO Incident VALUES('B-789', '2020-10-20 10:15:23', 'Erro X', 'Muito Grave');

-- popular tabela Line_incident -------------------
INSERT INTO Line_incident VALUES('L-693', '2020-10-19 18:42:54', 817.33);
INSERT INTO Line_incident VALUES('L-693', '2020-10-20 07:28:55', 283.05);
INSERT INTO Line_incident VALUES('L-725', '2020-10-19 23:50:09',  901.89);
INSERT INTO Line_incident VALUES('L-725', '2020-10-20 04:04:54', 386.59);
INSERT INTO Line_incident VALUES('L-056', '2020-10-19 16:45:54', 212.62);
INSERT INTO Line_incident VALUES('L-056', '2020-10-19 18:12:54',  964.58);


-- popular tabela Analyses -------------------
INSERT INTO Analyses VALUES('T-356', '2020-10-19 10:23:31', 'Serafina Caetano', '7800-814, Beja, Ferreira do Alentejo', 'Report: '); -- supervisor raimundo
INSERT INTO Analyses VALUES('T-617', '2020-10-19 11:51:28', 'Lia Castro', '4540-264, Norte, Aveiro, Vale de Cambra, Roge', 'Report:'); -- supervisor Lisa
INSERT INTO Analyses VALUES('B-735', '2020-10-19 11:22:54', 'Lia Castro', '7900-236, Beja, Ferreira do Alentejo, Figueira dos Cavaleiros', 'Report:'); -- linha da substação do Cosme
INSERT INTO Analyses VALUES('B-789', '2020-10-19 12:23:34', 'Serafina Caetano', '7800-814, Beja, Ferreira do Alentejo', 'Report: '); -- nenhuma substation
INSERT INTO Analyses VALUES('T-741', '2020-10-19 13:44:56', 'Serafina Caetano', '7800-814, Beja, Ferreira do Alentejo', 'Report: '); -- substation Narciso
INSERT INTO Analyses VALUES('B-789', '2020-10-19 14:31:51', 'Bento Siqueira', '5470-333, Norte, Vila Real, Montalegre','Report: '); -- nenhuma substation
INSERT INTO Analyses VALUES('B-240', '2020-10-19 15:59:23', 'Raimundo Passos', '5200-28, Norte, Distrito de Bragança, Mogadouro', 'Report: '); -- substation Narciso
INSERT INTO Analyses VALUES('L-056', '2020-10-19 16:45:54', 'Lia Castro', '7630-013, Beja, Odemira, Vale de Bispo', 'Report: '); -- nenhuma substation
INSERT INTO Analyses VALUES('B-789', '2020-10-19 17:22:00', 'Serafina Caetano', '7800-814, Beja, Ferreira do Alentejo', 'Report: '); -- nenhuma substation
INSERT INTO Analyses VALUES('L-056', '2020-10-19 18:12:54', 'Lia Castro', '4540-264, Norte, Aveiro, Vale de Cambra, Roge', 'Report :' ); -- nenhuma substation
INSERT INTO Analyses VALUES('L-693', '2020-10-19 18:42:54', 'Bento Siqueira', '5470-333, Norte, Vila Real, Montalegre', 'Report: '); -- nenhuma substation
INSERT INTO Analyses VALUES('B-789', '2020-10-19 22:23:54', 'Lia Castro', '4540-264, Norte, Aveiro, Vale de Cambra, Roge', 'Report: '); -- nenhuma substation
INSERT INTO Analyses VALUES('T-053', '2020-10-19 23:13:14', 'Cosme Alves', '4960-095, Norte, Viana do Castelo, Melgaco, Podre', 'Report: '); -- substation Serafina
INSERT INTO Analyses VALUES('L-725', '2020-10-19 23:50:09', 'Serafina Caetano', '7800-814, Beja, Ferreira do Alentejo', 'Report: '); -- nenhuma substation
INSERT INTO Analyses VALUES('T-053', '2020-10-20 00:23:50', 'Bento Siqueira', '5470-333, Norte, Vila Real, Montalegre', 'Report: '); -- substation Serafina
INSERT INTO Analyses VALUES('B-789', '2020-10-20 01:44:04', 'Serafina Caetano', '7800-814, Beja, Ferreira do Alentejo', 'Report :'); -- nenhuma substation
INSERT INTO Analyses VALUES('B-735', '2020-10-20 02:33:41', 'Lia Castro', '4540-264, Norte, Aveiro, Vale de Cambra, Roge', 'Report :'); -- substation Cosme
INSERT INTO Analyses VALUES('B-789', '2020-10-20 02:43:22', 'Lia Castro', '7900-236, Beja, Ferreira do Alentejo, Figueira dos Cavaleiros', 'Report :'); -- nenhuma substation
INSERT INTO Analyses VALUES('L-056', '2020-10-20 02:55:43', 'Serafina Caetano', '7800-814, Beja, Ferreira do Alentejo', 'Report: '); -- nenhuma substation
INSERT INTO Analyses VALUES('L-725', '2020-10-20 04:04:54', 'Cosme Alves', '4960-095, Norte, Viana do Castelo, Melgaco, Podre', 'Report: '); -- nenhuma substation
INSERT INTO Analyses VALUES('L-693', '2020-10-20 07:28:55', 'Lia Castro', '7900-236, Beja, Ferreira do Alentejo, Figueira dos Cavaleiros', 'Report: '); -- nenhuma substation
INSERT INTO Analyses VALUES('L-056', '2020-10-20 09:00:00', 'Lia Castro', '7630-013, Beja, Odemira, Vale de Bispo', 'Report :'); -- nenhuma substation
INSERT INTO Analyses VALUES('B-789', '2020-10-20 10:15:23', 'Marciano Macedo', '5360-492, Norte, Distrito de Bragança, Vila Flor, Vieiro', 'Report: '); -- nenhuma substation

-- popular tabela Line -------------------
INSERT INTO Line VALUES('L-056',74847947.1293);
INSERT INTO Line VALUES('L-725',10247804.5953);
INSERT INTO Line VALUES('L-693',89044520.4109);
INSERT INTO Line VALUES('L-704',43830009.6985);
INSERT INTO Line VALUES('L-454',52001059.3164);
INSERT INTO Line VALUES('L-281',45694118.8609);
INSERT INTO Line VALUES('L-623',76993483.2463);
INSERT INTO Line VALUES('L-651',43491671.4446);
INSERT INTO Line VALUES('L-580',50483076.7228);
INSERT INTO Line VALUES('L-461',17909414.9384);
INSERT INTO Line VALUES('L-012',87051761.3883);
INSERT INTO Line VALUES('L-112',22537925.5155);

-- popular tabela Bus_bar -------------------
INSERT INTO Bus_bar VALUES('B-240', 91490021.6083);-- BUS BAR 1
INSERT INTO Bus_bar VALUES('B-055', 82182386.9400);-- BUS BAR 2
INSERT INTO Bus_bar VALUES('B-083', 48019272.2022);-- BUS BAR 3
INSERT INTO Bus_bar VALUES('B-735', 60339958.9291);-- BUS BAR 4
INSERT INTO Bus_bar VALUES('B-181', 55371083.6511);-- BUS BAR 5
INSERT INTO Bus_bar VALUES('B-220', 58851160.9534);-- BUS BAR 6
INSERT INTO Bus_bar VALUES('B-078', 74205581.3928);-- BUS BAR 7
INSERT INTO Bus_bar VALUES('B-789', 62773240.2186);-- BUS BAR 8
INSERT INTO Bus_bar VALUES('B-346', 36148458.6593);-- BUS BAR 9
INSERT INTO Bus_bar VALUES('B-907', 73250927.4261);-- BUS BAR 10
INSERT INTO Bus_bar VALUES('B-712', 57507421.5406);-- BUS BAR 11
INSERT INTO Bus_bar VALUES('B-342', 99752877.6069);-- BUS BAR 12
INSERT INTO Bus_bar VALUES('B-462', 93202512.8157);-- BUS BAR 13

-- popular tabela Substation -------------------
INSERT INTO Substation VALUES(418.158431, -85.864778, 'Cosme Alves','4960-095, Norte, Viana do Castelo, Melgaco, Podre', 'Almeirim');-- 2 TRANSFORMER
INSERT INTO Substation VALUES(384.602028, -85.273058, 'Serafina Caetano', '7800-814, Beja, Ferreira do Alentejo', 'Alcacer do Sal');-- 1 TRANSFORMER
INSERT INTO Substation VALUES(415.570239, -75.535987,  'Marciano Macedo', '5360-492, Norte, Distrito de Bragança, Vila Flor, Vieiro', 'Barbadaes de Cima');-- 1 TRANSFORMER
INSERT INTO Substation VALUES(377.366132, -81.449714, 'Serafina Caetano', '7800-814, Beja, Ferreira do Alentejo', 'Almeirim');-- 3 TRANSFORMERS
INSERT INTO Substation VALUES(389.213853, -74.186985, 'Lia Castro', '7630-013, Beja, Odemira, Vale de Bispo', 'Santo Aleixo');-- 2 TRANSFORMERS
INSERT INTO Substation VALUES(376.748907, -81.947527, 'Narciso Mascarenhas', '3230-274, Centro, Coimbra, Penela', 'Ourique');-- 1 TRANSFORMER
INSERT INTO Substation VALUES(391.748117, -82.469373,  'Marciano Macedo', '5360-492, Norte, Distrito de Bragança, Vila Flor, Vieiro', 'Foros do Arra');-- 2 TRANSFORMERS
INSERT INTO Substation VALUES(371.324134, -85.959456, 'Thalita Torres', '3350-207, Centro, Coimbra, Arganil, Pombeiro da Beira', 'Alvor');-- 1 TRANSFORMER
INSERT INTO Substation VALUES(417.660804, -75.605331, 'Cosme Alves','4960-095, Norte, Viana do Castelo, Melgaco, Podre', 'Alvor');-- 1 TRANSFORMER


-- popular tabela Transformer -------------------
INSERT INTO Transformer VALUES('T-356','B-735', 'B-789', 60339958.9291, 62773240.2186, 418.158431, -85.864778);-- TRANSFORMER Cosme
INSERT INTO Transformer VALUES('T-053', 'B-181', 'B-083', 55371083.6511, 48019272.2022, 384.602028, -85.273058);-- TRANSFORMER Serafina
INSERT INTO Transformer VALUES('T-329', 'B-078', 'B-907', 74205581.3928, 73250927.4261, 415.570239, -75.535987);-- TRANSFORMER Marciano
INSERT INTO Transformer VALUES('T-135', 'B-342', 'B-220', 99752877.6069, 58851160.9534, 377.366132, -81.449714);-- TRANSFORMER Serafina
INSERT INTO Transformer VALUES('T-741', 'B-789', 'B-240', 62773240.2186, 91490021.6083, 376.748907, -81.947527);-- TRANSFORMER Narciso
INSERT INTO Transformer VALUES('T-617', 'B-712', 'B-055', 57507421.5406, 82182386.9400, 389.213853, -74.186985);-- TRANSFORMER Lia
INSERT INTO Transformer VALUES('T-889', 'B-181', 'B-346', 55371083.6511, 36148458.6593, 377.366132, -81.449714);-- TRANSFORMER Serafina
INSERT INTO Transformer VALUES('T-116', 'B-712', 'B-346', 57507421.5406,  36148458.6593, 391.748117, -82.469373);-- TRANSFORMER Marciano
INSERT INTO Transformer VALUES('T-380', 'B-240', 'B-789',  91490021.6083, 62773240.2186, 377.366132,  -81.449714);-- TRANSFORMER Serafina
INSERT INTO Transformer VALUES('T-002', 'B-220', 'B-240', 58851160.9534, 91490021.6083, 389.213853, -74.186985);-- TRANSFORMER Lia
INSERT INTO Transformer VALUES('T-610', 'B-907', 'B-462', 73250927.4261, 93202512.8157, 371.324134, -85.959456);-- TRANSFORMER Thalita
INSERT INTO Transformer VALUES('T-555', 'B-346', 'B-712', 36148458.6593, 57507421.5406, 377.366132, -81.449714);-- TRANSFORMER Serafina
INSERT INTO Transformer VALUES('T-005','B-712', 'B-907', 57507421.5406, 73250927.4261, 391.748117, -82.469373);-- TRANSFORMER Marciano
INSERT INTO Transformer VALUES('T-541', 'B-789', 'B-735', 62773240.2186, 60339958.9291, 418.158431, -85.864778);-- TRANSFORMER Cosme
INSERT INTO Transformer VALUES('T-301', 'B-220', 'B-181', 58851160.9534, 55371083.6511, 417.660804, -75.605331);-- TRANSFORMER Cosme


-- popular tabela Line_connection -------------------
INSERT INTO Line_connection VALUES('L-056', 'B-240', 'B-342');
INSERT INTO Line_connection VALUES('L-725', 'B-462', 'B-181');
INSERT INTO Line_connection VALUES('L-693', 'B-462', 'B-346');
INSERT INTO Line_connection VALUES('L-725', 'B-083', 'B-078');
INSERT INTO Line_connection VALUES('L-704', 'B-220', 'B-907');
INSERT INTO Line_connection VALUES('L-454', 'B-735', 'B-462');
INSERT INTO Line_connection VALUES('L-281', 'B-907', 'B-055');
INSERT INTO Line_connection VALUES('L-623', 'B-712', 'B-220');
INSERT INTO Line_connection VALUES('L-651', 'B-055', 'B-240');
INSERT INTO Line_connection VALUES('L-580', 'B-789', 'B-735');
INSERT INTO Line_connection VALUES('L-461', 'B-712', 'B-789');
INSERT INTO Line_connection VALUES('L-012', 'B-078', 'B-712');
INSERT INTO Line_connection VALUES('L-112', 'B-220', 'B-055');
