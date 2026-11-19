Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.104.109.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099474;
	b=1tn0VmtsC2hLwX9hOpOEtvjcpxuG5kst66f6W8xPl4p8VWU2ZB0wcEGQJ7ZbKQ4sauis
	 3oy82I3/6OjslCz97iTO7PrCdF21JwotVCX9qJ2FnAlnsp1+u6iHwklaH0Pabgc25L/ao
	 U6MTX1wXNBkt7hgLsEKpC+0C2jkHV+4XfOqIc/9uKPpzgk3ihFdaxgUF+QE5OHSpyAzB3
	 AgiOhHX3vhyFjiVGVVLbv1RoEdpCOWQMuYoG1byqZsW718LRVyvTiSJs4MNcYkfnoaimq
	 nc8KKKDOfpuolkHdJDXLJ9yXxKCd/FA4IHGsiX/hGTCNbeCXK7p63Lqsjs5tMCLcoSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099474;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=ddl+5wLd7JrcYCQu/tKnUPSlPM9wcUjbTD7xT0J9hdE=;
	b=Tzk4h35xLTObffQJfSWP12el22+r0ryycSw89wiQJEnnzH8iKIFB4b8Vyl+DPcpdFWcH
	 vziD6OzQwxGnQx/PPsWFpCNCVEbJMNVsyjzr2rkufdFyQDz6GIBkrq7NCBMhUdzDJYYlZ
	 8bkCcA9UzH+iOdHrrriQjHAvqlO0odsH3DuFUFcGGaU/3v/dyB4tLzSNnXOLjmEt8DJqI
	 s6B85m2HgjTzF2qjK3xlSlMlIuDaAof3QadHyZ5Rdh5StHVvuBCyPpYcspeIzAKj24HZU
	 BC4lLkfIr9JN3hi9o1MBfiMTxKFsOW29GrdbKMXuVviXaKYOZ8fsfEvCjBvlTXunLiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toradex.com;
	spf=pass smtp.mailfrom=toradex.com;
	dkim=pass header.d=toradex.com header.i=@toradex.com header.a=rsa-sha256 header.s=toradex-com header.b=eJ4tpTPZ;
	arc=none smtp.remote-ip=194.104.109.113
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF337606A320
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 14:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF337606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toradex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=toradex.com header.i=@toradex.com header.a=rsa-sha256 header.s=toradex-com header.b=eJ4tpTPZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1795099465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddl+5wLd7JrcYCQu/tKnUPSlPM9wcUjbTD7xT0J9hdE=;
	b=eJ4tpTPZhJwDsdCCyqWdjR/WwHp8lQx3iULJQXFszPlZsRgxfm1QJ1CYrhAlC8WT1ZByAZ
	lAQOCb8FyVp3Q/vrwi/fDD0dApBH/6VVmzDZZxiRY0FZgOfBzyPx6WTyokozUeJ9A8GYwi
	7tX1vDakIZ6UDIsOuA9U2X6zvDq9U2c=
Received: from ZR1P278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazon11022117.outbound.protection.outlook.com
 [40.107.168.117]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-73-tCU5VljqO6OmdbQnImAZ3A-1; Thu, 19 Nov 2026 14:44:22 +0000
X-MC-Unique: tCU5VljqO6OmdbQnImAZ3A-1
X-Mimecast-MFC-AGG-ID: tCU5VljqO6OmdbQnImAZ3A_1795099462
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR2P278MB927271.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:202::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 14:44:19 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2%3]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 14:44:19 +0000
Date: Thu, 19 Nov 2026 15:44:17 +0100
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Peng Fan <peng.fan@linux.dev>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peng Fan <peng.fan@oss.nxp.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v3 00/10] mailbox: imx: Use threaded handler to avoid
 kworker in imx's remoteproc
Message-ID: <av8LQa77SbshHmZD@francesco-nb>
References: <av6Wc+kHFKqwFHAR@shlinux89>
 <20261116102331.K8Sc86V9@linutronix.de>
 <20261119114041.GA166708@francesco-nb>
 <av8H7l6C8fmiHdbV@fedora>
In-Reply-To: <av8H7l6C8fmiHdbV@fedora>
X-ClientProxiedBy: FR2P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::15) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZRAP278MB0495:EE_|ZR2P278MB927271:EE_
X-MS-Office365-Filtering-Correlation-Id: 31e16043-56cf-4f3c-39b5-08df464b97c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|10067099003|4143699003|5023799004|56012099006|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|22082099003|18002099003
X-Microsoft-Antispam-Message-Info: KTup7N2qzdFVzEW0/Qp75792bpJzo033s++7ck+QIEwiil3/laugym1uWuRPmXP3oCItjhArrDcwafBzXHVfUE3hjuN+hdPdrWMY7gPs0jwbkRVS2V1mv4RYhuRVAdTGJG8SH6nCwgz9GcI9j0LMKLnhuCYFLpI5ZgGiUvWUKI8PSbvLx0eIQH+q+J2FzcGhR555aFDDDnu+fj9G1iicfa4JIuuFey9VH/Sp8fGHr5+D2KHIE5xYBmLxEoaqcBU+6cITPBVbcgZaZM3RVp7/b665WjM+jxLdg5oeWXKPi9AJ1y6I0zYuhm6WXUebwYMuRECq+1hPz/6ZmPgIZGEk7fBVOkqwhfOsEPgJyEiTdqafFGHWOWqvEBABlIWbSoPHEpOiTEcCQyXbqexmBj8nO84rZ/yrC/Zzt5YJmncMu2BWgruUusb8XgEklmLtXhBrto6JMg6IjDEU48aF3RNHSwi/Yq+DWGD6U2dYZwPABdMVmN/tSpaffUrqeG1urOZjTaaicBbMTQ/AajXurGmNCmbHjs/uK2tJXSe7/RlwPEyPSt8EQ0rSuNkYBxbwslb89XCDvP8a6sx4efycL3WDo3deacL/tTWPsr5Fj2PbCpPfU1SJgKGqd9r23pK3JPjgclkan/Y5pu8nyiERAWrL9NUwfLYvVqadzgcXH767xDc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(10067099003)(4143699003)(5023799004)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B2suc6pvRuFum8hj40BSqdFPK4ELHsFCLiBhYgRFhT/ravCNgrhnM9T8ro1C?=
 =?us-ascii?Q?iiJ/tv6tkYLAkw7xJnTT/JQPujJEQa7r38qnfIku575Rm/oQLchfIbqxhNRD?=
 =?us-ascii?Q?JKQTZTF4FWrDmBM0jSmpXryLtWeeQ9qRTQflMZl5GMw8bb6Ok/Q4pwRZyBnY?=
 =?us-ascii?Q?KGslF2vftVkU2bC6izWkdv4g9KohkSAg5FHf59g/P1lKUzvT6g3Bd2rX8RO9?=
 =?us-ascii?Q?4jsrc/ecohWS/yw+WujuGPhIV/r7g3pkQw07xSaoH7ok6l2g2qFl7e/DhkTA?=
 =?us-ascii?Q?dMDQuGiu/XmbbbrkG0k38kmQza1L+lzqafW8iUQT+HCOFl6MrWwQvvCPoINT?=
 =?us-ascii?Q?l8H1k2Qz2Tu6apSw3+yezSZQ64mpVaXH1Go+3deRMsJ4Ca3vLitZWDlBI2bR?=
 =?us-ascii?Q?0/XpJ+9KD27K+d7zZ5D338VASYt7qowvxvsTFWxXMsFzxT3QwONi1NAhCPBG?=
 =?us-ascii?Q?QW/csj7ETHukQEfLLTkIiOcdfxxEQNaYxzeoXmENrKUjE5xYrjKpekUEOeGO?=
 =?us-ascii?Q?BdgqRMzIV+1vjMtLSfEwBRmkipTRydEJA+6B153ZjaQp8lDK6MLAV3/Y7H8o?=
 =?us-ascii?Q?Kizn3fDQOUeji/h/Y+dCZNcJEr8geMyKWU1u6AZBQxNf+qRYxEcPIa3JKHsI?=
 =?us-ascii?Q?PqmiOaNCRXZR/5sTHcoMPdFxaHGXn4HVAu6qUnN054fWOtl9C26Mg3/64oKi?=
 =?us-ascii?Q?pObalA80JkcrBw+yTJMOU7YXKjwLrm/HP8kjO71Di883mE9KDRs+sQ2HKvO0?=
 =?us-ascii?Q?t4lo+dJJXJyG0VaKYk+pQ6CyYXgT7d5+a1WV0syyVs32+fz6aC6d3vA5Cu3a?=
 =?us-ascii?Q?3GRN/l7u4vsT4kfzki9li12uBzfdJqvrUJ87L0O6nNI3Vv3hswWAEMk2JMtj?=
 =?us-ascii?Q?wyAVFAbHYtqLToQnhsAGB2s3KP6uqhGbEYT3htbjrHPP+Z68EboBiNdRAydE?=
 =?us-ascii?Q?dSfaxTofJQJ/VLugtgmNRDSFXMzmHye6YntbsVjwQ07FLUfvxjWa4l43z6Ui?=
 =?us-ascii?Q?ji8AgHnU+WWritsVZdIMLJ06MqKrXyiY5a2foAcP5aAGqTsh9w/BBOo1aWLc?=
 =?us-ascii?Q?zl4YULK+EEP7DQTY2hsxCFTlX+Ewp9zv+Nqedrs8e7m8bQUvqUbBObI19CRJ?=
 =?us-ascii?Q?ZITgMy6MNC9qWU3667MWFETm/8CQDMrzAJEZZN/IuUWuR8bhj/T2UZ3L2/s5?=
 =?us-ascii?Q?n/QBI/0UiG+FKd2zEYaoZGYEN8FlKjI7ZlRK7AmJrVPqSVmRCcMW/Kc6rY1E?=
 =?us-ascii?Q?xAGXOehPP8/6v40RBnePoxiN39nFBEiIeYYVP6AG1SLDfQrZk0xvwaWB9Nwb?=
 =?us-ascii?Q?Fm4QMLNNgmWpiTApYncErpNsxcart8yg4q0zGc8fDPFxFVRvqfht3A7HTM7R?=
 =?us-ascii?Q?Ej4J5ooifPIkvWDKSks0+XekoreNIMGiskA+AgdGTFXGREzELxozLzjS6cxa?=
 =?us-ascii?Q?9AmyaK/obfDEQqXVYbIvAqVr8I4LaMI2skOSILCSSg2PYXwZvkxnO2IPlhlc?=
 =?us-ascii?Q?e5LXPyrrEg/I9nLUJQKHgMI/5Z0hmXhJoEj0nnkehXffadheRq9Yc5nMGvtB?=
 =?us-ascii?Q?nRArSHz+L2rxmQGNQRXv086gceSSVc1GQND4QIqFDNMqPVuv3Eq7gQyc5GUb?=
 =?us-ascii?Q?3qOmGHZSh5Jto3kOaTIloBLPg6W3Hqdu1tGN8Z0KrewxAy/xyO0GK/Cx1o7U?=
 =?us-ascii?Q?UVWQpree7WD0VjNMWH2GC1vhIO8qZ4CPAoCVCYFWpYsB+rPrd2SwIu3iFEvt?=
 =?us-ascii?Q?IQeHbDRzwq+ld/MCGizOT04EB0H56j0=3D?=
X-Exchange-RoutingPolicyChecked: 2ydbplWztFh1bXcdiXlYPNPhFqJJuzUw1a9ejvQKni9MNLTLgm3SEPbgr63cgpRoVXzlRveQZVtoyQpvsatGDxpsIc8f3GDBV8D8DYl6yFLSVTuwEr1zKWKGPVETHwjJMp7LHZAMyEXhXJVt9KBzOwPVeQh7u4e1waeewPckRVlg+CzSiGPD2z143fMz5lPX4ySGZSit0lkTDWu2LH/nPYBBHEcG/js9nFAIVJUPCNJi+r9umNNHEsxc4hW0N8IzNoIGdXoH6OuHPJPuHsoreHuo1sfe+6IFn3Dww7wzmoaZhBraj2ySYiknFT/zNVkfqeIf7AGWp6bVHgscNOqVDQ==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e16043-56cf-4f3c-39b5-08df464b97c2
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:44:19.3924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIzCX8ee/GL51WUBrC09g2SdaH2PbTCV5CsIWfjkdoSars4PNnfH4D4qx1IWW7z0d3xyAUkszUp7ODVyyK08PU7F5Md/d0kcFJsyTbK3tzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR2P278MB927271
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ouVe-9o9lDgqWNC2qOyRgq1I3wAoOxbzFISr_aomBrQ_1795099462
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 10:30:06PM +0800, Peng Fan wrote:
> On Thu, Nov 19, 2026 at 12:40:41PM +0100, Francesco Dolcini wrote:
> >Hello Peng, Sebastian
> >
> >On Mon, Nov 16, 2026 at 11:23:31AM +0100, Sebastian Andrzej Siewior wrot=
e:
> >> On 2026-11-16 10:23:41 [+0100], Francesco Dolcini wrote:
> >> > Our CI shows a ~10-15% eMMC sequential read throughput drop on i.MX8=
QXP
> >> > and i.MX8DX (Colibri iMX8X, Cortex-A35), starting with v7.2-rc1 and
> >> > still present in v7.4-rc3 (hdparm --direct -t: ~129 MB/s -> 105-120
> >> > MB/s on i.MX8DX). i.MX8QM, i.MX8M and i.MX9 are not affected.
> >> >=20
> >> > 5d1c0000.mailbox interrupt count before the test went from ~8k on v6=
.18
> >> > to 60k+ on v7.3/v7.4.
> >> >=20
> >> > Peng: any idea/suggestion? Does it makes any sense to you?
> >>=20
> >> Can you pin point it to a patch in this series? My guess is that
> >> something with the masking/ unmasking went wrong. The increase might b=
e
> >> result of the interrupt keeping firing while the threaded interrupt di=
d
> >> not have a chance to run.
> >
> >Reverting 36cac4b5101f, 3225a745f517, e55bea377d49 and 692e1bc96a5d
> >restores 149 MB/s with schedutil.
> >
> >
> >On Thu, Nov 19, 2026 at 02:25:55PM +0800, Peng Fan wrote:
> >> On Mon, Nov 16, 2026 at 10:23:41AM +0100, Francesco Dolcini wrote:
> >> >Peng: any idea/suggestion? Does it makes any sense to you?
> >>=20
> >> Please help test whether this helps:
> >>=20
> >> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailb=
ox.c
> >> index 683ccea6f2ba..e29044cf4b92 100644
> >> --- a/drivers/mailbox/imx-mailbox.c
> >> +++ b/drivers/mailbox/imx-mailbox.c
> >> @@ -635,7 +635,7 @@ static int imx_mu_startup(struct mbox_chan *chan)
> >>  {
> >>         struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> >>         struct imx_mu_con_priv *cp =3D chan->con_priv;
> >> -       unsigned long irq_flag =3D IRQF_NO_THREAD;
> >> +       unsigned long irq_flag =3D IRQF_NO_THREAD | IRQF_ONESHOT;
> >>         int ret;
> >>=20
> >>         pm_runtime_get_sync(priv->dev);
> >
> >It does not help.
> >=09
> >The analysis below was done with Claude help, on measurements I took on =
a
> >Colibri iMX8QXP. I hope you can pick it up from there, this is not my
> >area of expertise, and the best I can do is to send a revert for those 4
> >commits.
> >
> >Every SCU RPC now wakes the SCHED_FIFO irq thread (TX done and RX), and
> >while an RT task is runnable schedutil requests the maximum CPU frequenc=
y.
> >The A35 clock is CLK_GET_RATE_NOCACHE, so each frequency change is
> >followed by an SCU RPC reading the rate back, which wakes the irq thread
> >again. The loop never settles, even when idle, and the transitions (ATF =
+
> >SCU) are what costs the eMMC throughput (and I assume there is more
> >impact on performance than just this).
>=20
> Not sure whether this is root cause, per my understanding, cpu freq updat=
e
> is not that high frequency call.

Moving to `performance` from `schedutil` or reverting those 4 patches
solve the issue. And the significant increase on ctx switches and irq
count is real even on idle without any emmc test running.

> Let me setup a i.MX8QXP board and see what's going on there.
Thanks!

> BTW, i.MX8QM should
> also have same issue, but seems not impact in your report, a bit werid,
> might be because i.MX8QM has more cores :)

I agree, I did not run any kind of extensive performance test. What
happened is just that our emmc test started to fail, and this lead to
this series.=20

> Have you tried pin your emmc test thread to core3, or core2, just not cor=
e0.

It was never pinned to any core, so the scheduler decided on its own.
And multiple runs of the test all lead to the same results.

Francesco

