Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.104.111.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821037;
	b=LHZiVJkCidozz9+sGrHZYmfbcOJMNtfbfIwYbOeyzZc6ceWvF48fwffDUwPqDo4Izmhb
	 jL6b3rbMh+yUESrr8m6MWX/c8K00kmtI7UQR3JmbrAvugp0PqjY2Q/90sy5NMdTtEOv3u
	 1qV4TMQMHV8+xqfRrkTZsKH294uGguYSRZ7JG+llqqW/MI+HWpo+4K6M02PpccPuDRMw2
	 /dYRsI9W3qkUHecfxgIZ3qK3bOEsys6gWpOMHFpPnQ46+wHumuD4+oYkPl0cO9JMWPsgu
	 KAghbMd5PEiPH+msCi3n+MuVkVsOSraGrqOBF2iXs7vXFPgvsmyNIc87pjivXmokcQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821037;
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
	bh=pqwida33/VM75iN3zlR3VtqccdamTS/EN4HBvOYXc7k=;
	b=0PAEG9AgVAY53+lHOpb7QYz2B0ivtkyrjCnAHx3w7n5wAgpTI6HTDjLmJo0H/DvX8rb/
	 CvAOWrgXgB4UJG2xxrAh5AoLmqPTNJ8SvBwM2FVVH0tDLH+L0s35hTozXXFAkLmz+XsSg
	 eymufYHXo1TFCcgpx7146WqHO5c/LLklTZDKIu6TvH6mlNUlVudiZf02q64InNnvheEYn
	 xslyWiRtpQdLFCCBnoIRJUcXMU+r2FiWaGrDy4q2AYK5axGBv4G7FdmcwIREYlBJwJaKW
	 hZCe28PbB+a0IwNJ07BZWfUN/BXtiCGeFZ6HLPdatqgTm1i2BR2bZ5wH/swS+X7CajQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toradex.com;
	spf=pass smtp.mailfrom=toradex.com;
	dkim=pass header.d=toradex.com header.i=@toradex.com header.a=rsa-sha256 header.s=toradex-com header.b=Y4SxtFLW;
	arc=none smtp.remote-ip=194.104.111.113
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.111.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0335606A332
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 09:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0335606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toradex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=toradex.com header.i=@toradex.com header.a=rsa-sha256 header.s=toradex-com header.b=Y4SxtFLW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1794821029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pqwida33/VM75iN3zlR3VtqccdamTS/EN4HBvOYXc7k=;
	b=Y4SxtFLWVy7ml1ixjtvfP/yK6hcGNoD2+3MhYjaoWtGC6g0Ifye5iAOnaJP5t+XRVDngYo
	40S0qiyfCRuPdb68/unzd3tMcWQglBqB1dDwI4kOUzBM7WTrpKzov5bqA/A4LMRpK6Rzb4
	yfDRmEqmSYU6C459X3wTL2k3OE68xXs=
Received: from GVAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandwestazon11020129.outbound.protection.outlook.com
 [52.101.188.129]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-84-zzTGyk_cO6CjZVK1R-1YQg-1; Mon, 16 Nov 2026 09:23:46 +0000
X-MC-Unique: zzTGyk_cO6CjZVK1R-1YQg-1
X-Mimecast-MFC-AGG-ID: zzTGyk_cO6CjZVK1R-1YQg_1794821026
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR4P278MB1772.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:b2::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.14; Mon, 16 Nov 2026 09:23:44 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2%3]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 09:23:44 +0000
Date: Mon, 16 Nov 2026 10:23:41 +0100
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
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
Message-ID: <avrLnVFtgobyTwN1@francesco-nb>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
In-Reply-To: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
X-ClientProxiedBy: AS4PR09CA0005.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::11) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: ZRAP278MB0495:EE_|ZR4P278MB1772:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ccb7ab-0621-4583-6cca-08df43c34f64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|6133799003|5023799004|56012099006|10067099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261022075727099003
X-Microsoft-Antispam-Message-Info: AKHdyGHlS37rlJARDybQJB+TGI7jpV+9b+VeVCLrKcLLdtEjI6dD4x8VuJNFbcNI3sjGRWh2kszIq6o9W9nV6b3JOrn0KfaXrrA5aVNWAFROMxIJO1S1hZ9MWm5B1hBzRi+pdaH1wxmcQy6URGLsBpK5TJnNHEKbU+wWefw2mlJbJFb5O22/uFvhghGVVj6pBVLFZO99xv5u5hfXeeS50RmwVgCEAXG6YwmHn0Hvx4IDVJyQgL1dTJRIQLKfE7z/+l1oCyaFvJoUUVk0mpWUlK7JbyX3I8noyS72BgJ2HRaJj3wsLM9tjr6AU9+5nc4PEnibsOQ6lwUXHhUQTgnKM5Wa7Y+5QRFj40a5sLfYyKq6CqNSud8eUs1KH2C3iRNisJIcsa+7jjTK18a1oiGdweJH4iD6QNe0tKBlV67veYtezkL63jTRqm26ncTRUCUBB7VOPvxZ26pmObBYaGh+tcMXO/DS5/Y3Z9Q8S2PjWs15r+mKHId0n0+IMeQyogaNNc8h9i0kAFng/WoFmRsBVJFzBaRXfEYP4xiauA4QgUMC128nAMuEvMrV2owQmyRj0F/pxSkP/MZJfPyqkIJNXHD93+E//0B5xchQz+uu/a09zE4wNn5k+gX3lOQCSBDzyniHleXqU3aYuGRvuxwgDHBzYHQ/LLsD2nVJEspYam4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(5023799004)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022075727099003);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eG/fLyMCylugFeQK+B/S5j3Hxu1Qg2wagp6ZtBZn6rhaHXWcoXZ6GveS80il?=
 =?us-ascii?Q?gnz30QXsXgcU7gzQ0wJ/HtcO6mDc8/xFFf6AVXeMjnAs1aK5IWy023p2i+Ik?=
 =?us-ascii?Q?tdZf5WeaBxzaf1HG/hwgIPajl396HpKojl2v1oY9EnA2hUZxpu05k2hXUPRK?=
 =?us-ascii?Q?z5DuVyHFoMge54Not/89ZOTpKf63oYpTM/IzkIDvGJPT81MDMs2v55UnrEDV?=
 =?us-ascii?Q?pPymzr1lPZ+/jkM5LRykjKmv8q/uTcE5dYx6KR0QhdZNS3/DRyN3nkdyYY+7?=
 =?us-ascii?Q?AriG5aRcqWXpiaUqeWqCc6wBOhRnjQDRI0Er9hn+XlpSgLcoWgw6mRqqGX8o?=
 =?us-ascii?Q?fvt44QEoOF9W7GQRd4YwAV2IIqMBK6jVGO2Bb9StkqKKn5sIoJOrQ/3j6WZi?=
 =?us-ascii?Q?FNFIouW2Jy7h9vh6gipPToIvGB2V+4//dz7LxzdSy9I6XzYpwhSh791cxMzy?=
 =?us-ascii?Q?YiRaBp2EVnXs7b8v+taFn9rll/d7KEKtEfJTcvxfOaB2L/9XRUMyD0ON+/TC?=
 =?us-ascii?Q?h8hfA/8d1i/jVgbfxksm6v5BtO68cwQY8r2fBd+cNPfVdhJIBpyWJJpeM27A?=
 =?us-ascii?Q?m8tkS+BIUQlLXcwjWomEyWgEduS0rUOR6hSR9qKtIbZ6J5YK/zgKqR+WhDwJ?=
 =?us-ascii?Q?Vis7wbiOilf5JNHfzPA3IeU/nFABEB26owl/dz357hw7eZdXyCErV/mupJGd?=
 =?us-ascii?Q?qtt6NSChFPOpXbcJfWxjWz+d4w8GyjF2p9W59NOb1MNMrCjkJHEkYFv+0zvy?=
 =?us-ascii?Q?VPtPtYD+EDxBIv1hlH45W4jZy8BiDbdkDTh2U9bbjVRL+4zx5bwHJMEIrqT1?=
 =?us-ascii?Q?+79sdnqStMkbXDIK2OjsLvXwMBNcgIRXIRm+Z8LGzR0Tkg82aS4SIjLc4MNR?=
 =?us-ascii?Q?1kSWW42+uJD/i9i2sMA6viSd5mOaPVup/NkrwsPjEOcSBHWswLaGznrkCabD?=
 =?us-ascii?Q?BYpoYXSeXr8hztfOWQrkOK+JSLbiWuN5h1eHmCpnRoaEbpeFlSDrGLIdbX/9?=
 =?us-ascii?Q?A8oxpffVE6J4DJYZO//xLShrQHC9k8ImKONQR3BbPyq18+p4YORCsqVwcRlq?=
 =?us-ascii?Q?ViQxbFxDSUSKHPhe7ZxQ6245mw/M/pE8NC8bsLCGu3zmAjTgKY+gGELfRAx5?=
 =?us-ascii?Q?vb8M6oaiqLZix6RzXu67h7Bb8HA6gL60KLjv3/XioFnsNlBNcGthOMzJc+4Q?=
 =?us-ascii?Q?Q0C3YzgiBewtsouMvOdEr9qyNGXhOkFhP94CtP1G92a1ItunrkY8/bH8HK7g?=
 =?us-ascii?Q?DNCKohqTXZED9ippDeof/xWWWQpCcDfAlWLWXHIreL9ec71r/IK+CICHIw/q?=
 =?us-ascii?Q?REagssAQZsLM+nqQvFzW5sALQFLlG32EocU+/TefTzmf3oOa8PW0CjRuSMXB?=
 =?us-ascii?Q?W3v5x8+O2KU/1+/HuQhJs6ru6mnw/+d2fdbFZr5SA39/lAxD8dfXjXJdbhw9?=
 =?us-ascii?Q?6tOAaYLfuQwQl84zpxOW1WA33YkoB6EXvYuZeFCOkfSqESaTO+c5Y2WQr1F0?=
 =?us-ascii?Q?cpWkZbv7W/QR0IZlDey5PVOy+VpCBsC3zJ/EUFS4/+787n5L+5169rk5LUHS?=
 =?us-ascii?Q?t1jxaCqO5o5CvI6UopeTDXiuWmSWBI2eXL18I92Fi+X7HOICfiilhn5+ECK+?=
 =?us-ascii?Q?IEWuZCZ6AyHRiVB8TPPTFU6zfuJ0eFdwwbIwKAFgO/qd8iEsNaQF6zEUbqyX?=
 =?us-ascii?Q?ybQ/tWsMPHVOjEprDWlaRH23kmyxv1ScwOVRITM07JVMiq0r0uMH9+ki+Wjl?=
 =?us-ascii?Q?/PhPJXKREhyayxZTcp6wQCdhlC2103Q=3D?=
X-Exchange-RoutingPolicyChecked: cnYw4asfbWvVLu9Y+XO+kq+kMJSXWxBb8puuI2/k54EHznQ9R/Lm4R/dAd+THvIbGAmL3wrc3WPL60L37HkKWjVUaywiTn88kOsu5a+X2xxKkJaQdk9+16Lv8JjyMDIpvm0VkKeRjV+EshMz7gUR25dQyQ89tPCYhQIXEVCsXIiMIPzF5HPEAj/dqI4lT1Kf5koR7f221abr6Hmph7aYeeVtE1aphGJ5s5OfqYdK8YRkX5gOPbF7BnkNLy2pc62UnDHw0zisBPOS8eBUbp+MR+UZFN3THVqgo/HoZOTopIuYURlfjcugeqex3yjsRySGNnSfID2vW7Mee2yENnuVug==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ccb7ab-0621-4583-6cca-08df43c34f64
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:23:44.1927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVNf2mGvGyp4bQwnK+Eirwmp0CLKTZsi4NTlHVbuIR3BnEBi57hp8tRDjxhjY51+gjZQr/M2Ue0tYp1omsG5cVFBh6VI91o/4fD9M81h6p8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR4P278MB1772
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hgUKKrUXl-CQZpoIQKv8Ai-6gQWvhftY_ScR0kaNafE_1794821026
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Sebastian, Peng

On Wed, Jun 17, 2026 at 08:55:25AM +0200, Sebastian Andrzej Siewior wrote:
> The imx's remoteproc driver uses a kworker from its mailbox callback to
> complete the request. The reason is that the imx mailbox driver invokes
> the callback from its interrupt handler and the remoteproc callback (at
> least the rpmsg-tty) requires a preemptible context.
>=20
> This works but is problematic in a PREEMPT_RT environment where the
> latency of the invocation is important. By scheduling a kworker the
> high task priority from the threaded handler is lost and the kworker
> competes for CPU ressources with every SCHED_OTHER task in the system.
> This can lead to long delays on a busy system with other RT threads
> which are less important than the completion of this request.
>=20
> Looking over other mailbox driver, like the arm_mhu for instance, they
> use a threaded interrupt handler to invoke the callback. This avoids the
> kworker detour.
>=20
> The here suggested change utilises a threaded interrupt to invoke the
> callback. The primary handler mask the interrupt source so that the
> handler can run without getting interrupted by the interrupt again.
> Doing so avoids marking the interrupt IRQF_ONESHOT so that in a
> shared-interrupt environment the other interrupt can still fire while
> the first is masked.
>=20
> The first four patches are result of the sashiko review. Does not look
> critical.
>=20
> This change was tested on a im93 board with rpmsg-tty driver.

Our CI shows a ~10-15% eMMC sequential read throughput drop on i.MX8QXP
and i.MX8DX (Colibri iMX8X, Cortex-A35), starting with v7.2-rc1 and
still present in v7.4-rc3 (hdparm --direct -t: ~129 MB/s -> 105-120
MB/s on i.MX8DX). i.MX8QM, i.MX8M and i.MX9 are not affected.

5d1c0000.mailbox interrupt count before the test went from ~8k on v6.18
to 60k+ on v7.3/v7.4.

Peng: any idea/suggestion? Does it makes any sense to you?

Francesco

