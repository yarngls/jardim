-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 05-Maio-2018 às 17:08
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `encanto`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `criancas`
--
USE encanto;

CREATE TABLE `criancas` (
  `id` int(255) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `sexo` varchar(255) DEFAULT NULL,
  `dataNascimento` date NOT NULL,
  `idade` int(255) DEFAULT NULL,
  `alcunha` varchar(255) DEFAULT NULL,
  `numeroPMI` varchar(255) DEFAULT NULL,
  `propina` int(255) DEFAULT NULL,
  `nomePai` varchar(255) DEFAULT NULL,
  `nomeMae` varchar(250) DEFAULT NULL,
  `encaregadoEducacao` varchar(250) DEFAULT NULL,
  `morada` varchar(250) DEFAULT NULL,
  `dataInicioJardim` date DEFAULT NULL,
  `estado` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `criancas`
--

INSERT INTO `criancas` (`id`, `nome`, `sexo`, `dataNascimento`, `idade`, `alcunha`, `numeroPMI`, `propina`, `nomePai`, `nomeMae`, `encaregadoEducacao`, `morada`, `dataInicioJardim`, `estado`) VALUES
(493, 'Adilson Francisco Pereira Bento Monteiro', 'Feminino', '2013-06-01', 0, '', '', 0, '4000', 'Adilson Bento Monteiro', 'Sónia Cristina Pereira Sousa Varela', '', NULL, ''),
(494, 'Adione Patricia Furtado A. Borges', 'Feminino', '2013-05-20', 0, '', '324/2013', 0, '4000', 'DeonildoPatricia Almeida Borges', 'Adozinda Correia Furtado', '', NULL, ''),
(495, 'Adriel Lopes Oliveira', 'Masculino', '2014-05-16', 0, '', '80/2014', 0, '4500', 'Admilson Antonio Garcia Oliveira', 'Jorcelina Lopes Monteiro', '', NULL, ''),
(496, 'Adriel Stalin Tavares Correia', 'Masculino', '2016-04-29', 0, '', '', 0, '3000', 'Adilson Stalin Fortes Correia', 'Janira Semedo Lopes Tavares Correia', '', NULL, ''),
(497, 'Adrielle Eulicia Almeida Pereira', 'Feminino', '2012-03-15', 0, '', '', 0, '4000', 'António Manuel Fonseca Pereira', 'Adalgisa Almeida Gomes', '', NULL, ''),
(498, 'Aila Liticia Varela da Afonseca', 'Feminino', '2014-05-20', 0, '', '', 0, '3000', 'Frederico Augusto Carlos Tavares da Afonseca', 'Ana Leonor Rodrigues Varela', '', NULL, ''),
(499, 'Ainah Nzingha Soares Barros', 'Feminino', '2016-10-12', 0, '', '', 0, '5000', 'Nuno Miguel Teixeira Veiga Ramos', 'Ema Helena Soares de Barros', '', NULL, ''),
(500, 'Alan Nathan Gonçalves Andrade Cardoso', 'Masculino', '2014-03-03', 0, '', '', 0, '2500', 'Nuno Alexandre Costa Cardoso', 'Eunice Suely Gonçalves A. Cardoso', '', NULL, ''),
(501, 'Alexandre da Moura Barbosa', 'Feminino', '2013-02-18', 0, '', '', 0, '5000', 'Alexandre Herculano Barbosa', 'Arcângela da Costa da Moura', '', NULL, ''),
(502, 'Alexandre Wagner Varela Monteiro', 'Masculino', '2012-06-26', 0, '', '', 0, '4000', 'Elisidro Lopes Monteiro', 'Adelcia Maria Varela Sanchez', '', NULL, ''),
(503, 'Alicia Krisma Tavares Gonçalves ', 'Feminino', '2013-09-16', 0, '', '', 0, '2500', 'Adelino Fernandes Gonçalves', 'Antonieta Mendes Tavares', '', NULL, ''),
(504, 'Allana Manuela Rendall Carvalho Gonçalves', 'Feminino', '2013-02-08', 0, 'Allana', '', 0, '2500', 'Valter Emanuel Pereira Carvalho Gonçalves', 'Célia Patricia Rendall Neves de Pina', '', NULL, ''),
(505, 'Anderson Joel Rodrigues dos Santos Ferreira', 'Masculino', '2013-02-18', 0, '', '', 0, '2500', 'Olivio Fernades dos Santos Ferreira', 'Hélida Andreia Rodrigues Varela', '', NULL, ''),
(506, 'Andre Alexandre Furtado Almeida Borges', 'Masculino', '2014-09-05', 0, '', '', 0, '4000', 'Deonildo Patricia Almeida Barros', 'Adozinda Correia Furtado', '', NULL, ''),
(507, 'Angela Aniela Monteiro Tavares', 'Feminino', '2013-10-10', 0, '', '', 0, '4000', 'Manuel Antonio de Oliveira Lopes Tavares', 'Emilia de Carvalho Garcia Monteiro Tavares', '', NULL, ''),
(508, 'Anilce Patrícia Semedo Varela', 'Feminino', '2012-01-20', 0, '', '', 0, '4000', 'Anilton Mendes Varela', 'Joana Eniza Semedo Ferreira', '', NULL, ''),
(509, 'Anildo Alves Neves', 'Feminino', '2013-05-04', 0, '', '', 0, '2500', 'Azinildo Duarte Neves', 'Karina Lopes Alves', '', NULL, ''),
(510, 'Antonielle Shannara de Oliveira de Melo', 'Feminino', '2016-03-11', 0, '', '31/2016', 0, '3000', 'Gilson Monteiro Carvalho De Nello', 'Monica Sanchez De Oliveira', '', NULL, ''),
(511, 'Asael Davi Rendel Rocha Levy', 'Masculino', '2016-02-03', 0, '', '', 0, '3000', 'Nuno Miguel Fonseca Santos Levy', 'Susana Soraia Rendal Rocha', '', NULL, ''),
(512, 'Awa Sokhna', 'Feminino', '2014-06-12', 0, 'Awa', '', 0, '4000', 'Matar Sokhina', 'Mame Astou Dioum', '', NULL, ''),
(513, 'Ayanne Sophia Silva Barreto de Carvalho', 'Feminino', '2012-03-03', 0, 'Ayanne', '', 0, '2500', 'Danilo Lopes Barreto de Carvalho', 'Jocimara Romina Silva Neves', '', NULL, ''),
(514, 'Aylla Pinto Lopes', 'Feminino', '2016-10-20', 0, '', '', 0, '3000', 'Adilson Moreira', 'Liana Cristina Pinto Lopes', '', NULL, ''),
(515, 'Brenda Hayla Barros de Lima', 'Feminino', '2013-02-28', 0, '', '163/2013', 0, '2500', 'Joaquim José Tavares de Lima', 'Maria de Fátima de Pina Barros', '', NULL, ''),
(516, 'Bryan Joao Barbosa Silva', 'Masculino', '2014-12-07', 0, '', '', 0, '4500', 'Jose Silva Correia da Naura Junior', 'Nelida Sofia Barbosa Fernandes', '', NULL, ''),
(517, 'Caike Heberson Pereira da Rosa Andrade de Pina', 'Masculino', '2013-05-14', 0, '', '', 0, '4500', 'Héber Cláudio A. De Pina', 'Carla Euridece Pereira Costa da Rosa', '', NULL, ''),
(518, 'Carlos Jorge Rosa do Rosário', 'Masculino', '2013-11-15', 0, '', '', 0, '4000', 'José Carlos Fortes do Rosário', 'Ana Andreia Lopes da Veiga Rosa', '', NULL, ''),
(519, 'Chistian Addison Lopes Varela Moreira', 'Masculino', '2012-11-30', 0, '', '', 0, '5000', 'Adilson Lucílio Varela Silva Moreira', 'Liana Cristina Pinto Lopes', '', NULL, ''),
(520, 'Chistian Elias Santos da Veiga', 'Feminino', '2013-10-11', 0, '', '', 0, '2500', 'Elias José da Silva da Veiga', 'Nádia do Rosário Gomes Santos', '', NULL, ''),
(521, 'Christian Addison Lopes Varela Moreira', 'Masculino', '2012-11-30', 0, '', '', 0, '5000', 'Adilson Lucílio Varela Silva Moreira', 'Liana Cristina Pinto Lopes', '', NULL, ''),
(522, 'Christian Elias Santos da Veiga', 'Feminino', '2013-10-11', 0, '', '', 0, '2500', 'Elias José da Silva da Veiga', 'Nádia do Rosário Gomes Santos', '', NULL, ''),
(523, 'Christian Maciel Monteiro Lopes', 'Masculino', '2017-12-17', 0, 'Chistisan', '', 0, '5000', 'Gilson Jorge Varela Lopes', 'Kátia Milucy Fátima Monteiro', '', NULL, ''),
(524, 'Danilson Pires Gonçalves', 'Masculino', '2012-05-15', 0, '', '', 0, '2500', 'José Maria Gonçalves Semedo', 'Deolinda Semedo Pires', '', NULL, ''),
(525, 'Dario Irineu Goncalves Tavares', 'Masculino', '2014-02-24', 0, '', '18/2014', 0, '4000', 'Irineu Tavares Lopes da Silva', 'Maria Jesus da Silva Goncalves Tavares', '', NULL, ''),
(526, 'David Chinedu Ibe', 'Masculino', '2012-08-30', 0, '', '.31/13', 0, '2000', 'Elijah Chijike IBE', 'Ozioma Goodness UDE', '', NULL, ''),
(527, 'Delcio Gomes Lopes Fernades', 'Masculino', '2012-02-21', 0, '', '', 0, '2500', 'Delvair Lopes Fernandes', 'Sandra Manuela Gomes da Silva', '', NULL, ''),
(528, 'Denir', 'Masculino', '0000-00-00', 0, '', '', 0, '3000', '', '', '', NULL, ''),
(529, 'Derick Borges da Costa Furtado', 'Masculino', '2015-10-17', 0, '', '542/2015', 0, '4000', 'Endres Herculano da Costa Furtado', 'Sandy Angela da Veiga Borges', '', NULL, ''),
(530, 'Diana Cristina Pereira Bento Monteiro', 'Feminino', '2013-02-01', 0, '', '', 0, '4000', 'Adilson Bento Monteiro', 'Sonia Cristina Pereira Sousa Varela', '', NULL, ''),
(531, 'Diana Ramos Nunes', 'Feminino', '2012-04-18', 0, '', '38/2012', 0, '2500', 'Jailson Pereira Silva', 'Dilma Helena Ramos Alves', '', NULL, ''),
(532, 'Diego Alves Timas Mendes', 'Masculino', '2013-04-06', 0, '', '', 0, '2500', 'Fernando Timas Mendes Alves', 'Janice de Fátima Alves Timas', '', NULL, ''),
(533, 'Diego Edmilson Silva Tavares', 'Masculino', '2013-05-24', 0, '', '', 0, '2500', 'Edmilson Corsino Moreno Tavares', 'Marisa Sofia Moniz Silva', '', NULL, ''),
(534, 'Dilma Celine Moreno dos Santos', 'Masculino', '2014-03-18', 0, '', '', 0, '3000', 'Mario dos Santos Fernandes', 'Dilce Aline Moreno Fernandes', '', NULL, ''),
(535, 'Dionisio Sergio Semedo', 'Masculino', '2017-02-02', 0, 'Denir', '', 0, '3000', '', 'Sue Ellen Silva Brito', '', NULL, ''),
(536, 'Dírcio Helano Tavares de Pina', 'Masculino', '2013-09-21', 0, '', '', 0, '4000', 'João Carlos de Pina Teixeira', 'Dulce Helena Tavares dos Santos', '', NULL, ''),
(537, 'Djanyr Patrick Brito Costa Duarte', 'Masculino', '2015-09-11', 0, '', '', 0, '2500', 'Carlos Amilcar Costa Duarte', 'Katia Cesaltina ', '', NULL, ''),
(538, 'Djassy Patrick Brito Costa Duarte', 'Masculino', '2015-09-11', 0, '', '', 0, '2500', 'Carlos Amilcar Costa Duarte', 'Katia Cesaltina ', '', NULL, ''),
(539, 'Dymara Soares da Luz', 'Feminino', '2012-10-26', 0, '', '638/12', 0, '2500', 'Adilson Freire da Luz', 'Vera Lúcia Moreira Soares', '', NULL, ''),
(540, 'Ediane Sofia Gomes', 'Feminino', '2015-01-06', 0, '', '116/2015', 0, '', '', 'Zélia Denise Soares de Carvalho Gomes', '', NULL, ''),
(541, 'Edmara Helena Tavares Monteiro', 'Feminino', '2014-12-05', 0, '', '', 0, '3500', 'Edmilson Fabio Montero Mendes', 'Dirce Helena Tavares de Pina', '', NULL, ''),
(542, 'Edmauro Barbosa de Pina', 'Masculino', '2012-03-15', 0, '', '188/2012', 0, '3000', 'Celestino de Pina Pires', 'Verónica de Pina Barbosa Cardoso', '', NULL, ''),
(543, 'Elen Evanissa Cardoso Afonso', 'Feminino', '2012-11-24', 0, '', '', 0, '2500', 'Evanilson da Luz Afonso Landim', 'Sandra Sofia Cardoso Duarte', '', NULL, ''),
(544, 'Eliane Sofia da Cunga', 'Feminino', '2015-03-21', 0, '', '301/2015', 0, '2000', '', 'Elisangela Neves Chantre da Cunha', '', NULL, ''),
(545, 'Elina Mandaleny Moreno Frederico Tavares', 'Feminino', '2013-11-22', 0, '', '159/2013', 0, '3000', 'Fanuel de Carvalho Frederico Tavares', 'Maria Elicina Moreno Brito', '', NULL, ''),
(546, 'Ellen Evilin Almeida Teixeira', 'Feminino', '2014-07-28', 0, '', '563/2014', 0, '4000', 'Anderson Fernandes Teixeira', 'Ana Mafalda Moreia Almeida', '', NULL, ''),
(547, 'Ellen Kataleya Moreno da Veiga', 'Feminino', '2015-01-06', 0, '', '', 0, '5000', 'Crestino Elisio Tavares da Veiga', 'Auzira Carolina Furtado Moreno', '', NULL, ''),
(548, 'Ellen Vaz Monteiro', 'Feminino', '2012-01-10', 0, '', '', 0, '2500', 'Carlos Soares Monteiro', 'Diva Cármen Mendes Araújo Vaz', '', NULL, ''),
(549, 'Ellen Victoria Andrade Fonseca', 'Feminino', '2015-07-04', 0, '', '382/2015', 0, '5000', 'Nilton Jorge Fonseca', 'Isaura Eugenia Dos Santos A. Barros', '', NULL, ''),
(550, 'Emily Paola Moniz Barreto', 'Feminino', '2014-09-24', 0, '', '420/2014', 0, '4000', 'Emilio Paulino Freire Barreto', 'Sandra Heloisa Gomes Moniz', '', NULL, ''),
(551, 'Ender Rodrigues', 'Masculino', '2012-03-28', 0, '', '134/2012', 0, '2500', '', 'Daneila Gomes Tavares Rodrigues', '', NULL, ''),
(552, 'Enzo Miguel Almeida Melícia Assunção', 'Masculino', '2012-05-05', 0, '', '', 0, '2500', 'Joel Jorge Melício Pires Assunção', 'Suzete de Jesus Pires Almeida', '', NULL, ''),
(553, 'Enzo Quinze da Silva Teixeira Barbosa', 'Masculino', '2014-04-07', 0, '', '276/2014', 0, '4000', 'Nilson Albertino Silva Barreto Teixeira Barbosa', 'Beatriz barbosa da Silva', '', NULL, ''),
(554, 'Eriane Sofia da Cunha', 'Feminino', '2015-03-21', 0, '', '301/2015', 0, '', '', 'Elisângela Sofia da Cunha', '', NULL, ''),
(555, 'Erickson da Cunha dos Santos Andrade', 'Masculino', '2012-11-19', 0, '', '168/2013', 0, '4000', 'António Pedro dos Santos Andrade', 'Elisangela Neves da Cunha Chantre', '', NULL, ''),
(556, 'Fabricio Carlos Semedo Lopes Moreira', 'Masculino', '2014-04-30', 0, '', '', 0, '4000', 'Carlos Manuel Gomes Morreira', 'Helida Licinia Semedo Lopes', '', NULL, ''),
(557, 'Flavia Gissimara Carvalho Moreno', 'Feminino', '2015-03-09', 0, 'Flavia', '123/2015', 0, '2500', 'Ivaldino Moreno Vaz', 'Humara Jandira Carvalho da Veiga', '', NULL, ''),
(558, 'Francyelle Gomes da Costa Tavares', 'Feminino', '2012-05-10', 0, '', '', 0, '4000', 'Francisco da Costa Tavares', 'Adelcia Gomes dos Reis', '', NULL, ''),
(559, 'Gabriel Patrick Semedo de Brito', 'Masculino', '2015-09-13', 0, 'Gaby', '', 0, '5000', 'José Victor Almeida de Brito', 'Deolinda Veiga Semedo', '', NULL, ''),
(560, 'Hairis António Fernandes Vaz', 'Masculino', '2014-01-29', 0, 'Hairis', '45/2014', 0, '2500', 'António Carlos Borges Vaz', 'Evelise Estela Tavares Silva Fernandes', '', NULL, ''),
(561, 'Hayla Victoria Teixeira Oquendo', 'Feminino', '2014-11-23', 0, '', '', 0, '3000', 'Alberto Vladimir Oquendo Llanes', 'Iraima Patricia Tavares Teixeira', '', NULL, ''),
(562, 'Heaven Noah Oliveira de Brito Gomes', 'Feminino', '2014-10-21', 0, '', '', 0, '2500', 'Edmilson Lopes de Brito Gomes', 'Patricia Semedo Oliveira', '', NULL, ''),
(563, 'Henrique Michael Fortes Almeida', 'Masculino', '2012-08-27', 0, '', '', 0, '4000', 'Bruno Michael Almeida Varela', 'Euridice Tatiana Fortes Monteiro', '', NULL, ''),
(564, 'Hian dos Reis Batista', 'Masculino', '2015-01-30', 0, '', '187/2015', 0, '5000', 'Joao Augusto Vieira Batista', 'Denise Patricia Pires dos Reis', '', NULL, ''),
(565, 'Hildimara Solange Soares de Carvalho N. Dias', 'Feminino', '2014-11-14', 0, '', '615/2014', 0, '2500', 'Hidilberto do Nascimento Dias', 'Jalina Francisca P.A.s de Carvalho', '', NULL, ''),
(566, 'Igor Paulo Semedo Fernandes  Rodrigues', 'Masculino', '2014-06-25', 0, '', '', 0, '3000', 'Ailton Fernandes Lopes Rodrigues', 'Rosangela Teresa Evora Semedo Lopes', '', NULL, ''),
(567, 'Iris Sofia Fernandes Monteiro', 'Feminino', '2016-05-22', 0, '', '', 0, '3000', 'David Oscar Ribeiro Monteiro', 'Veronica Eveline Andrade Fernandes', '', NULL, ''),
(568, 'Isaana Cristina Garcia Teixeira', 'Feminino', '2015-05-01', 0, '', '1727', 0, '3000', 'Isaac Antonio Mascarenhas Mendes Teixeira', 'Ana Cristina Afonso Garcia', '', NULL, ''),
(569, 'Isael Davi Rendal Rocha Levy', 'Masculino', '2016-02-03', 0, '', '', 0, '3000', 'Nuno Miguel Fonseca Santos Levy', 'Susana Soraia Rendal Rocha', '', NULL, ''),
(570, 'Ivan Mauricio Nunes de Sá Nogueira S. Frederico', 'Masculino', '2012-06-06', 0, '', '349/2012', 0, '4000', 'José Augusto de Sá Nogueira S. Frederico', 'Ivânia Sofia Nunes da Costa Fernandes', '', NULL, ''),
(571, 'Jailine Evilise Pereira Alves Miranda', 'Feminino', '2014-06-03', 0, '', '', 0, '5000', 'Jailson Alves Miranda', 'Josenilde do Rosario Pereira', '', NULL, ''),
(572, 'Jair Jorge Gomes Andrade', 'Masculino', '2012-09-11', 0, '', '', 0, '2500', 'Jorge Manuel Sanchez Correia Andrade', 'Janile Gomes Correia Varela', '', NULL, ''),
(573, 'Jaydon da Costa Soares de Carvalho', 'Masculino', '2015-08-07', 0, 'Jay', '', 0, '2500', 'Janito Soares de Carvalho', 'Doris de Fátima Ramos da Costa', '', NULL, ''),
(574, 'Jayson  Hendrix Ribeiro Semedo Lopes', 'Feminino', '2016-05-06', 0, '', '', 0, '3000', 'Marco Aurelio Evora Semedo Lopes', 'Stacy Patricia Gomes Pereira Ribeiro', '', NULL, ''),
(575, 'Jennifer Kleynira Lopes M0nteiro', 'Feminino', '2012-03-16', 0, '', '.09/2012', 0, '2500', 'Jerry Kleyne Gonçalves Soares Monteiro', 'Lenira Oswaldina de Jesus Lopes Semedo', '', NULL, ''),
(576, 'Jonathan Emanuel Cardoso Vaz', 'Masculino', '2015-04-13', 0, '', '215/2015', 0, '3000', 'Emanuel Maria Gomes Vaz', 'Claudia Janete Vaz Cardoso', '', NULL, ''),
(577, 'Kaio Rafael Lopes Freire Semedo', 'Masculino', '2015-06-17', 0, '', '', 0, '4000', 'Joaquin Freire Semedo', 'Carla Ivania Lopes Cabral', '', NULL, ''),
(578, 'Kelvin Alberto Castro Mendonça', 'Masculino', '2012-09-23', 0, '', '349/2012', 0, '4000', 'Alberto Bastos da Costa Mendonça', 'Isolinda Lopes castro', '', NULL, ''),
(579, 'Kennedy Noel Garcia Osorio', 'Masculino', '2014-02-16', 0, '', '', 0, '4000', 'Jailson Pedro do Carmo C. Osorio', 'Nilva Karine Semedo Garcia Moreno', '', NULL, ''),
(580, 'Keoma Daniela Garcia Pimentel', 'Feminino', '2013-09-10', 0, '', '245/2013', 0, '2500', 'Daniel da Comceição Pimenta Lopes', 'Adalberta Isabel Afonso Garcia', '', NULL, ''),
(581, 'Laiza Maria Santos Cardoso', 'Feminino', '2012-04-27', 0, '', '149/2012', 0, '2500', 'José Luis Santos Cardoso', 'Viviane Santos Cruz', '', NULL, ''),
(582, 'Lara Xavier Tavares Marques', 'Feminino', '2013-02-22', 0, '', '167/13', 0, '2500', 'Euclides Marques Martins', 'Yara Patricia Xavier Tavares', '', NULL, ''),
(583, 'Larrissa Isabel Vieira Cardoso', 'Feminino', '2014-06-26', 0, '', '323/2014', 0, '4000', 'Madueno Semedo Cardoso', 'Maria Isabel Vieria Ferreira Barbosa', '', NULL, ''),
(584, 'Laura Karina de Pina Correia ', 'Feminino', '2012-05-01', 0, '', '.14/2013', 0, '2500', 'Inácio de Oliveira Correia', 'Carla Helena Tavares de Pina', '', NULL, ''),
(585, 'Leandro Hilario Nascimento Correia', 'Masculino', '2016-04-14', 0, '', '68/2016', 0, '3000', 'Laurentino Baessa Correia', 'Suzilene Monteiro Nascimento', '', NULL, ''),
(586, 'Leandro Mascarenha Tavares Fereira', 'Masculino', '2014-09-26', 0, 'Leandro', '', 0, '2500', 'Joao David Tavares Ferreira', 'Tamirse Mascarenhas Fernades Cabral', '', NULL, ''),
(587, 'Lenilson Da Luz Moreno Sanchez', 'Masculino', '2014-11-18', 0, '', '517/2014', 0, '4000', 'Faustino Moreno Sanchez', 'Nelita Tavares', '', NULL, ''),
(588, 'Leticia Victória de Sousa Furtado', 'Feminino', '2013-04-15', 0, '', '266/2013', 0, '2500', 'Floriano Cabral Barros Furtado', 'Cláudia Virgínia Elisângela Castro de Sousa', '', NULL, ''),
(589, 'Lohanna  Malya Alfama da Silva', 'Feminino', '2015-02-02', 0, '', '191/2015', 0, '3000', 'Oldair Barros Pina da Silva', 'Solange Salome Fortes Alfama', '', NULL, ''),
(590, 'Lucas Guilherme Soares Moreira', 'Masculino', '2013-08-22', 0, '', '', 0, '4000', 'Admir de Fátima Varela Moreira', 'Ana Lourde Soares Furtado', '', NULL, ''),
(591, 'Mamediarra Bousso Diagne', 'Feminino', '2012-12-20', 0, '', '.03/2013', 0, '4000', 'Amar Diagne', 'Fatoumata Zahra Thiam', '', NULL, ''),
(592, 'Marcello Marques Pinto Coelho Martins', 'Masculino', '2015-06-28', 0, '', '381/2015', 0, '4000', 'Flavio Coelho Martins', 'Alzira Jesus Marques Pinto', '', NULL, ''),
(593, 'Marcos Eduardo Gomes Fortes', 'Masculino', '2014-05-10', 0, '', '193/2014', 0, '2500', 'Adilson Cesar Fortes', 'Naria Auxiliadora Santos Gomes', '', NULL, ''),
(594, 'Mateus Rocha Tavares', 'Masculino', '2015-01-07', 0, '', '153/15', 0, '5000', 'Fernando Jorge da Veiga Tavares', 'Neusa Aline Barros de Pina Rocha', '', NULL, ''),
(595, 'Maura Patricia Tavares de Carvalho Cabral', 'Feminino', '2013-01-21', 0, '', '126/13', 0, '2500', 'Mauro David de Carvalho Cabral', 'Vera Patricia Tavares Ferreira', '', NULL, ''),
(596, 'Mayra Fernandes Gomes', 'Feminino', '2015-04-12', 0, 'Carleny', '', 0, '4000', 'Carlos Jose Gomes', 'Carminia Fernandes Gomes', '', NULL, ''),
(597, 'Michael José Lopes Tavares', 'Masculino', '2013-01-25', 0, '', '', 0, '4000', 'José Eduardo Lopes Tavares', 'Mulu Gesit Hailegiorgis', '', NULL, ''),
(598, 'Miguel de Pina da Luz', 'Masculino', '2014-05-06', 0, '', '', 0, '3000', 'Wilson da luz Fortes de Pina', 'Escolastica Jesus Silva de Pina da Luz', '', NULL, ''),
(599, 'Moises Patricio de Pina Cabral ', 'Masculino', '2014-09-26', 0, '', '150/2014', 0, '6000', 'Moises Barbosa Gomes Cabral', 'Patricia Pereira de Pina', '', NULL, ''),
(600, 'Nayla Vitoria Batista Cardoso', 'Feminino', '2015-09-01', 0, '', '240/2015', 0, '3000', 'Manuel de Jesus Cardoso Gomes', 'Maria Teixeira Batista', '', NULL, ''),
(601, 'Nelcyanne Adileny de Brito Lopes', 'Feminino', '2014-08-13', 0, 'Nelcyanne', '360/2014', 0, '2500', 'Adilson Jorge da Silva Lopes', 'Elexandrina Patrícia Varela de Brito', '', NULL, ''),
(602, 'Neymara Marline Gomes Barros', 'Feminino', '2015-02-18', 0, 'Ney', '84/2015', 0, '4000', 'Sidney Gomes Cardoso', 'Jaqueline Andrade Barros', '', NULL, ''),
(603, 'Nilton de Pina', 'Masculino', '2014-06-11', 0, '', '382/2014', 0, '2500', '', 'Albertina de Pina Tavares', '', NULL, ''),
(604, 'Noah Gabriel Borges da Rosa Gonçalves', 'Masculino', '2013-08-19', 0, '', '', 0, '4500', 'Votorino Teixeira Gonçalves', 'Nídia Margarida da Rosa', '', NULL, ''),
(605, 'Olivia Ogechi Obi', 'Feminino', '2014-11-25', 0, '', '320/14', 0, '2000', 'Elijah Chijike IBE', 'Ozioma Goodness UDE', '', NULL, ''),
(606, 'Oridiany Teresa Alves de Pina', 'Feminino', '2012-10-02', 0, '', '', 0, '2500', 'Odair António Lopes de Pina', 'Elisângela Ledo Pontes Alves', '', NULL, ''),
(607, 'Rachid Francisco Neves Semedo', 'Masculino', '2013-02-14', 0, '', '', 0, '4000', 'José Francisco Évora Tavares Semedo', 'Celsa do Céu Limas Neves', '', NULL, ''),
(608, 'Rahí dos Reis Raimundo', 'Masculino', '2016-05-19', 0, 'Rahí', '279/16', 0, '3000', 'Manuel Fonseca Raimundo', 'Sandra Helena dos Reis Lima Raimundo ', '', NULL, ''),
(609, 'Ravi Barbosa Vicente Gomes', 'Masculino', '2015-01-13', 0, '', '', 0, '3000', 'Albertino Humberto Tavares Gomes', 'Vanessa Patricia Barbosa Vicente Mendes', '', NULL, ''),
(610, 'Raydeer Mendes Baptista Semedo', 'Masculino', '2013-06-14', 0, '', '256/2013', 0, '4000', 'Rodnelo Fernandes Mendes Baptista da Silva', 'Verónica Sofia Rocha Semedo', '', NULL, ''),
(611, 'Raylson Amarildo Oliveira Pererira', 'Masculino', '2014-11-03', 0, '', '', 0, '4000', 'Jailson Amarildo Pereira Silva', 'Cely Oliveira Pereira', '', NULL, ''),
(612, 'Ricardo Anilson Semedo de O. G. Rodrigues', 'Masculino', '2014-02-27', 0, '', '131/2014', 0, '5000', 'Cecilio Lopes Rodrigues', 'Ana Sofia Semedo Oliveira Garcia', '', NULL, ''),
(613, 'Ricardo Jorge Semedo Lopes', 'Masculino', '2013-10-25', 0, '', '', 0, '5000', 'Antonio Pedro Moreno Lopes', 'Eneida Cristina Horta Semedo', '', NULL, ''),
(614, 'Ronilson da Veiga Barbosa', 'Masculino', '2013-10-10', 0, '', '', 0, '2500', 'Carlos Alberto Barbosa', 'Nelida de Fátima da Veiga Barradas', '', NULL, ''),
(615, 'Sabrine de Pina Pontes Rodrigues', 'Feminino', '2015-01-29', 0, 'Sabrine', '', 0, '2500', 'Ailton Sady Teixeira Paiva Roduigues', 'Sandra Eloisa de Pina Pontes Rodrigues', '', NULL, ''),
(616, 'Safir Maxwell Silva Andrade', 'Masculino', '2015-08-28', 0, 'Safir', '', 0, '3000', 'Alexis Andrade Monteiro', 'Mirian Eunice dos Reis Silva', '', NULL, ''),
(617, 'Said de Pina Pontes Rodrigues', 'Masculino', '2012-03-08', 0, '', '', 0, '2500', 'Ailtom Saidy Teixeira Paiva Rodrigues', 'Sandra Eloisa de Pina Pontes Rodrigues', '', NULL, ''),
(618, 'Samiara Miranda Moreno', 'Feminino', '2014-06-27', 0, '', '.05/2014', 0, '2500', 'Evanilson de Jesus Almeida Moreno', 'Sandra Maria Semedo Miranda', '', NULL, ''),
(619, 'Sara Eunice Spinola Timoteo', 'Feminino', '2012-03-30', 0, '', '410/2013', 0, '2500', 'Filde Temóteo Mubiala', 'Leila Revania Moniz barbosa Spínola', '', NULL, ''),
(620, 'Sidney Paulo Fernades Vicente Barbosa', 'Masculino', '2015-04-06', 0, '', '', 0, '3000', 'Sneed Paulo Vicente Barbosa Fernandes Gomes', 'Keila Elisa Fernades Borges', '', NULL, ''),
(621, 'Tayla Yara Conceicao da Luz', 'Feminino', '2013-04-16', 0, '', '27/2013', 0, '2500', 'Maximiliano Jorge Silva da Cruz', 'Clara Silva de Conceiçao', '', NULL, ''),
(622, 'Thais Filipa Cardoso de pina da Rosa', 'Feminino', '2014-07-05', 0, '', '', 0, '2500', 'Cristiano Santo Amado da Rosa', 'Tatiana Cardoso de Pina', '', NULL, ''),
(623, 'Thais Sophia Vieira', 'Feminino', '2014-10-26', 0, '', '', 0, '', 'Kelvin Reis Lopes Santos', 'Dilma Ramos Vieira', '', NULL, ''),
(624, 'Thalia Olimpia Sanchez S. S. Tavares', 'Feminino', '2014-05-29', 0, '', '', 0, '3000', 'Carlos Odair Pina Semedo Tavares', 'Conceiçao Socorro Sanchez dos Santos', '', NULL, ''),
(625, 'Thiago Filipe Silva Rodrigues', 'Masculino', '2014-08-26', 0, 'Helmer', '503/2014', 0, '2500', 'Domingos Fernades Rodrigues', 'Ionilde Semedo Fonseca silva Marques', '', NULL, ''),
(626, 'Tiago Anderson Barros de Sa Nogueira', 'Masculino', '2015-04-04', 0, '', '243/2015', 0, '4000', 'Wagner Abubakar de Sa Nogueira', 'Carla Lopes Barros', '', NULL, ''),
(627, 'Tiago Micael Ferreira Cabral', 'Masculino', '2012-07-26', 0, '', '310/2012', 0, '2500', '', 'Filomena Ferreira Cabral', '', NULL, ''),
(628, 'Valdir', 'Masculino', '0000-00-00', 0, '', '', 0, '3000', '', '', '', NULL, ''),
(629, 'Valentina dos Anjos Lopes Pereira', 'Feminino', '2017-02-07', 0, 'Valentina', '', 0, '5000', 'Janilton Noel Carvalho Pereira', 'Magda Patricia Lopes de Pina', '', NULL, ''),
(630, 'Vitória Andrade Etouh', 'Feminino', '2013-06-11', 0, '', '', 0, '4000', 'Barnabé Kodjo Etouh', 'Magda Helena Tavares Andrade', '', NULL, ''),
(631, 'Vitsel Andrade Etouh', 'Masculino', '2013-06-11', 0, '', '', 0, '4000', 'Barnabé Kodjo Etouh', 'Magda Helena Tavares Andrade', '', NULL, ''),
(632, 'Willston Samir Ramos Barros de Almeida', 'Masculino', '2013-07-26', 0, '', '', 0, '4000', 'Wilson Andreny Barros de Almeida', 'Samira Ramos de Pina', '', NULL, ''),
(633, 'Willziane Samiris Ramos Barros', 'Feminino', '2014-11-03', 0, '', '', 0, '4000', 'Wilson Andreny Barros de Almeida', 'Samira Ramos de Pina', '', NULL, ''),
(634, 'Wilson Jorge Semedo Tavares', 'Masculino', '2012-12-16', 0, '', '', 0, '2500', 'Avelino Jorge Tavares', 'Maria do Rosário Semedo Correia', '', NULL, ''),
(635, 'Yoanne Júnior Mendonça Andrade', 'Masculino', '2013-09-26', 0, '', '', 0, '2500', 'Patrício Fernades Andrade', 'Samira Maria Lopes Furtado Mendonça', '', NULL, ''),
(636, 'Zé Elvis Monteiro Rodrigues', 'Masculino', '2013-03-10', 0, '', '', 0, '2500', 'José Carlos Rodrigues', 'Maria António Silva Monteiro', '', NULL, ''),
(637, 'Zélia Giovanna Rodrigues Monteiro', 'Masculino', '2015-08-18', 0, 'Zélia', '', 0, '4000', 'Elisidio Lopes Monteiro', 'Hélia de Rosário', '', NULL, ''),
(638, 'Kéggner Kedir Pires Dias', 'Masculino', '2014-03-31', 0, 'Weslley', '152/2014', 0, '2500', 'Adérito Quedir Dias de Barros', 'Carine Ilisa Alves Pires', '', NULL, ''),
(639, 'Gabriel Varela Gomes', 'Masculino', '2017-05-17', 0, '', '', 0, '5000', 'Admilson Antonio Cardoso Gomes Pires', 'Silvina Correia Varela', '', NULL, ''),
(640, 'Mérida Luana Marques Tavares Barbosa', 'Masculino', '2014-10-31', 0, 'Luana', '549/14', 0, '2500', 'Jaime Luis Tavares Barbosa', 'Djanina Betania da Costa Correia Marques', '', NULL, ''),
(641, 'Victor Rafael Rocha Semedo', 'Masculino', '2017-03-21', 0, 'Victor', '146/17', 0, '5000', 'Natalino Lopes Vaz Semedo', 'Graça Aline Barros de Pina Rocha Semedo', '', NULL, ''),
(642, 'Emilya Latifa Correia Mendes de Barros ', 'Feminino', '2013-07-15', 0, 'Emily', '483/13', 0, '2500', 'Edson Arantes Rocha Gomes de Barros', 'Elisângela Mendes Varela Ramos Correia', '', NULL, ''),
(643, 'Gilsianny Thais Martins Rodrigues', 'Feminino', '2012-03-23', 0, '', '210/2012', 0, '', 'Gilberto Martins de Pina', 'Tânia Cristina Rodrigues Fernandes', '', NULL, 'Matriculado');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `criancas`
--
ALTER TABLE `criancas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `criancas`
--
ALTER TABLE `criancas`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=646;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
