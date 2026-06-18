Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013049.outbound.protection.outlook.com [52.101.83.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D93325B081
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2026 01:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781747675; cv=fail; b=cJLGQ7o5eO38q2q2c9XEgLOxO3HVL9lvcQHz2/lgrjAVtcRpQk+8mQZ0sagjxAP9EDzVZ5zot5arO94OSddMIhTt0qvAD+LhGfvnH7XLjhO3YEVouzBQI7Gg2fFTOvFhGiZUo5VdrhdNLniY+mOdSOiSu8s1+U/nVcuSUegVKpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781747675; c=relaxed/simple;
	bh=YoZ54ESZXe9xZcSfJ2t2DbUL0vv2CZ0Tlyqei6QswI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pZz0tk6lvOXCIkwlawv8PGFw4K60yM0GXR2kIBh6qKxAg0P11DmnU4aDe4T02+KXKjm1OnCSPWQ4BgPAl+QaX5bxE+vAYCF8syfJmbChSoVbU8OXM6wci7XypWsDZVdJsKI7KgKF+HJ7qITu1AISiCOSfH0hV1iWh2w6KS4rNNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=baKREban; arc=fail smtp.client-ip=52.101.83.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="baKREban"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuBP3n6ve0Yp0PlWH++gMJYF8AkoEtosTIKFaIGWH0dTplPiht6jWvrUjfsefY/hLPzhCddzb52gwURH2Wosdt4lroGISPftSUP698F8DGhMkW1DazS5RDC18SaX7jBNWIZMEWst2yxHW09RJU6i/6rCyT2Fm+qXlM244upsgaVYApVB0xmzCKSQLpweEnoD1QNHqsJ8tz56hWZ6Rbal3k9kWv4o1vZoLBAP11qNV7i/FOiqwlowW0HVfeDegi6ZAfShIU/KEPGmHQh2hc5ug9eHcvafbCfZel7h89WUnZgXerkS/U1P0eBx4YX1OdKvl177CyhK8X/mdo9TyIazMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRg8pYwQJjuB4yomkbADfjELf8MRyt2hTNDpXpxR73M=;
 b=vFHp7GUwlPqnd35m9+9hLbKBAq+9+pHKwgbUgGURRZT6plfKpvate7piNJnfpk4SuQifzyzRj+yIkDTuT2Nqz6snU5KEmrv7w5Db+x5bY4wfVkIcNVVs/WNaMQcgKqa3UEGVdNshR4qTQYg/MYcg4FwQBMsqd675eIeNbCJT/KGUlkmcBx68YPsLFbPpo6kkbDtGTqRyLG5Qx/TEcAP53EzcVemIXUzBZY4nwZk+0EL+XQIEjmsLxhQhW67RwFJfjbhivzazxqpigJuKucQ+vlZL+YJ1xtrTO8Ir/OzNvnU2VInzGura47dVcwUJtWrfoTZQrpw5VlG5a6NlDK0nlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRg8pYwQJjuB4yomkbADfjELf8MRyt2hTNDpXpxR73M=;
 b=baKREban88wrNLCuiaNYfWOx+aUK0FiaYOl3IZEBseQwTG0XZg+PFntndYd2LQunEKZ4S3ELBVA8S2yitK88xlYryy5+OFLA4TCeY3O6s+ivmo+tX9Yo3wsFb1PhgInLmRYmYkwg/94w9z/kBqk+XmJnkQcV4LuXh/acnYOI1U+S/Oke9VJxJ1/iFp0e8VAjb88H5SGux4v+3C8iV/gNDjJj9jFYuN3WH3+j62DtUSoOImzr+A399SpMSQ6c5+E4ByR0628Si8WzPOB677PTXxqdlxbNFV0cBYabH4CsDDnIWnpkn4XRQCr6d5VT4oCBox6Alq1WuTuiPg08v8G9Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB7163.eurprd04.prod.outlook.com (2603:10a6:10:fe::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 01:54:30 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 01:54:30 +0000
Date: Thu, 18 Jun 2026 09:57:46 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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
Subject: Re: [PATCH v3 01/10] mailbox: imx: Forward the timeout/ error in
 imx_mu_generic_tx()
Message-ID: <ajNQmpuztAWXA0wP@shlinux89>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
 <20260617-imx_mbox_rproc-v3-1-77948112defc@linutronix.de>
 <ajNO3KSZV/elWONW@shlinux89>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajNO3KSZV/elWONW@shlinux89>
X-ClientProxiedBy: SG2P153CA0051.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::20)
 To AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB8PR04MB7163:EE_
X-MS-Office365-Filtering-Correlation-Id: 92a04019-19ba-43cc-4ef7-08deccdc8985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|23010399003|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	5Mr+3B40k4dhqzhk0OhFk8YsMoU42n24TmqFbLyf0PyPhSMuvG0GTVDdWam2SIKC9vdHStJj3AoRzJnNHEPyN+VGBh/eP8LtDlmJs5LaHtgBrlmqE1u3o5AEfpO0NgP+r2wdeGgp0FZ6g+pWeh/PYoztHYuAPHXzwYb8p0u2U4shhlqOqRXXAjkjhgF5GS3SuMj5iMwkPQYCeeJHc4VOmQs7GjQCgoRzuoH5kdig7ADe1npCbugLeRZxhHWxai9IDHgnfdGabYZO+Xvl2dQE6nwepBW0d462/Uu5hl3OD7ennqpBr6W7c9o7KUaIxKE73trUUBLfvutLspPuiLhkNeyqOTmuu2ylQT8x5FGBRld6w74z3X2P/0LSEvpw7pj7dSuFmDsYz9eZjbeGRlWdOtxkPefmh9p9NRoVIykcs16c1/2F/MmOg5mMOFOdQPz2pmXuyJuYRzDkL75hZlIueFnrvVMZvdIBa3E1rbbPtXnuu4+lXJaQ+lSFWjNLqzir2fmMmOnEP3h0FOB+fm9lAn6LUWrzcSpe8UVhHamyWG2n5qs5uZcFmGPWXIVU7bjSb1GJKIz3GV1/WxS2iCrxmJp4yt4Xru6JIzmijt/EkGApmhChY9oHQZdSf9w5tbUz8Sa9ox7rsDs/s3jcXAnbpUbZegImn1O7LvE9agNRzv5uj1swCD8ernw3A5N0LZMP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OK/rcjYEFRDSeut0fX3T1gsuv6GJHguTmZVkQ0pH8MOx5R6sApz77JaK9IUY?=
 =?us-ascii?Q?jEhOpjPdG9R3oh7HVJb/GR1lEPCFMInfqDyzXOTn3eCFAkvyXSjZqI9yEg+e?=
 =?us-ascii?Q?/2FnSo/Oue5sNie66TExkGP9ICzkE3QD2KIaBNuky/sWKhcPbP8FghpyIUK/?=
 =?us-ascii?Q?b3F7QTLE6r2YyaPcai1Jh5gYLQurmy4W8LSGQ83f3H8K7FCxiIJRC+LJQvZG?=
 =?us-ascii?Q?g2ZCaBA4M8fYEY1803jkWw3GN0s4nMBuFRYrgilTKisXQ533cXmwjnZjkXvK?=
 =?us-ascii?Q?v8lycRQTAR1e2L2iqnv4E7jpeWELNU2jTzmuQl+Qw8InS2fZiwHIe9+Xtpx6?=
 =?us-ascii?Q?BLXw0Tz3ffMD0irdii+rQ62ZYrwDn74ZIQYGfBGrQ2Sfpl/12gfNTnTlw48v?=
 =?us-ascii?Q?im6H4klPWqmjBMKRFr3KFKXmQ7/ifhOps43RJbgxFP9JvwP9zKzEDi9AvoG8?=
 =?us-ascii?Q?rax+FSyM2K1jkBBtP0KkPJryrbiRaLUZqRgkiM7mSzoV/kim6o6v24ZykLvF?=
 =?us-ascii?Q?ZMeI8Vggq6ynYPHH8m9evpBluwis6pVFz7KCefaKmiSMJCtUKSTMD8L9s8V0?=
 =?us-ascii?Q?hE63DztAnDX7JNMOFPiPDsM9O4q5xqj8zBqqH/Cejpbu3weZQFxweZzR7p1x?=
 =?us-ascii?Q?MROpQ4vt18UqoJ1ILNV40bQLMkxLhnqys199YNUWyXCDGubkeToduOlt3V9P?=
 =?us-ascii?Q?PRaFq+1SnamXC4WRpMqajknoMMFeiZkhEH1pnxUCqc2AKZbrvPiKMl8c5T4h?=
 =?us-ascii?Q?MkaNm1omup5n5zTp1PwPjr6DGfpqrjiwbkqZR5Zkuj+u9hDxipYGP5HpJ722?=
 =?us-ascii?Q?OviVKzSVngdPLzn1GxNTR5WghkfcwkLTrMYxMDiKjZjbFlU1gHrYiJSt/1gJ?=
 =?us-ascii?Q?NXxbPdsfcmR4PoTw1iEltWBCe2EEvFkMhvJXr1Q46pbf9mQTCKZk/wtu8ayr?=
 =?us-ascii?Q?6MK/mXh+b2w1evPYd2pG1aNIHYrg00P+LtEhw2IntX97SxUez+lzTeU6a6gu?=
 =?us-ascii?Q?pRXGOyswd5NEOtVGDJv7/Empn/9Ch0LTWv5eCQNhmC2bxyZLiU6nLnxXKDIN?=
 =?us-ascii?Q?t/IZM02buRdYNqKiQM/CMW71Wc4d62yjC7ZLaNKPpycBf7hv/P0nD0Pw8Rs9?=
 =?us-ascii?Q?OOf257ZjkCeU31R4vra+HTqE5UjljnsorcUEGjFmfb0CEydhM6wqN3R8PGaa?=
 =?us-ascii?Q?rIAfsqsoZ4v9gCbOPjc/tYKhF02rT9S6AZU/QARJBCzQre6mBdaaPDU2TjhG?=
 =?us-ascii?Q?EMfjp/KOWOHccDgpMsgjsXiX136OGQhi4x6z+H6E+C7J8p44cX3vrnSXCxy/?=
 =?us-ascii?Q?szcD7YzwHS/uNb5JlgF8PxxR4/0L+HnC4Vldr3RcBmM7rq3yS/V7aJlSIG3/?=
 =?us-ascii?Q?LewbWpZK+Yi3dOZ/mJppGk6YjmKj0BMtRU7DV1IrEvwM0DjyM4o6sGBab85B?=
 =?us-ascii?Q?1f3JLvgBIsmZ8lBHRj6PEm9KYmBngfXIe+iykXnrLJ+07PbbtF29HYfuYXM7?=
 =?us-ascii?Q?NAkwLxQMER4zBT0YpN4UALFBNxHrD6Xx0BSr2xzXCidtTtXq5jFE8hluHRrQ?=
 =?us-ascii?Q?ZVlrb15SobmkrGXvOg15j+Ct5bfc2kjWTIfwwNgoLdRrfVjyprhWq/qzkHK1?=
 =?us-ascii?Q?m5DLs1I7HY31KF4ytkhXDSxLxvsECMLevoZKk25ymioKVe7assu+OV0rO0v4?=
 =?us-ascii?Q?YcFY2L5RKwRmeiiYRp/v6YLpwprl48zuJs35f3H4yXTLGUb5V/PHLxWOvHVg?=
 =?us-ascii?Q?RY/DqeJLK++YftJjtViXLeAD89qCv6e1f0jDDZU7WAthRHEIMO5/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a04019-19ba-43cc-4ef7-08deccdc8985
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 01:54:30.6285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hw2mK6Cap1w0+KmbkFHFHEHkmhy5gA5LZePFCKdacAWQ/9mxKmkmD8NtzpYuy/VwEEnTKPC17zFZbg5mx/Qj9mO72tCjNcC4yjnz66XSA9vX//Y9raYBl3gnpdKcH6Rw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7163

On Thu, Jun 18, 2026 at 09:50:20AM +0800, Peng Fan wrote:
>Hi Sebastian,
>
>Thanks for your patch.
>
>On Wed, Jun 17, 2026 at 08:55:26AM +0200, Sebastian Andrzej Siewior wrote:
>>imx_mu_generic_tx() for the IMX_MU_TYPE_TXDB_V2 type polls on a register
>>which may timeout and is recognized as an error. This error is siltently
>>dropped and not dropped to the caller.
>>
>>Forward the error to the caller.
>>
>>Fixes: b5ef17917f3a7 ("mailbox: imx: fix TXDB_V2 channel race condition")
>>Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>>---
>> drivers/mailbox/imx-mailbox.c | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
>>index 246a9a9e39520..0028073be4a71 100644
>>--- a/drivers/mailbox/imx-mailbox.c
>>+++ b/drivers/mailbox/imx-mailbox.c
>>@@ -227,6 +227,7 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv,
>> 	u32 val;
>> 	int ret, count;
>> 
>>+	ret = 0;
>> 	switch (cp->type) {
>> 	case IMX_MU_TYPE_TX:
>> 		imx_mu_write(priv, *arg, priv->dcfg->xTR + cp->idx * 4);
>>@@ -259,7 +260,7 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv,
>> 		return -EINVAL;
>> 	}
>> 
>>-	return 0;
>>+	return ret;
>> }
>
>I just rethink about the logic here and rewrite the logic as below.
>error code is propogated to caller and poll timeout are removed.
>Please see whether it looks good for you or not.

Ignore this. Pushed the button too early

>
>[PATCH] mailbox: imx: make TXDB non-blocking and avoid polling in atomic context
>
>+
> 		imx_mu_write(priv, IMX_MU_xCR_GIRn(priv->dcfg->type, cp->idx),
> 			     priv->dcfg->xCR[IMX_MU_GCR]);

Oh. there might be issues without waiting here. For example, Linux just writes
the doorbell to notify SCMI processor power up a power domain, but when linux
continues to write registers, the SCMI processor may not fetch the message, then
linux will crash.

Regards
Peng

>-		ret = -ETIMEDOUT;
>-		count = 0;
>-		while (ret && (count < 10)) {
>-			ret =
>-			readl_poll_timeout(priv->base + priv->dcfg->xCR[IMX_MU_GCR], val,
>-					   !(val & IMX_MU_xCR_GIRn(priv->dcfg->type, cp->idx)),
>-					   0, 10000);
>-
>-			if (ret) {
>-				dev_warn_ratelimited(priv->dev,
>-						     "channel type: %d timeout, %d times, retry\n",
>-						     cp->type, ++count);
>-			}
>-		}
> 		break;
> 	default:
> 		dev_warn_ratelimited(priv->dev, "Send data on wrong channel type: %d\n", cp->type);
>-- 
>2.50.1
>
>Thanks,
>Peng
>
>> 
>> static int imx_mu_generic_rx(struct imx_mu_priv *priv,
>>
>>-- 
>>2.53.0
>>
>
>
