Return-Path: <SRS0=Nf08=DW=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E93BC433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 01:37:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7C7722254
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 01:37:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="pFjrlkTR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729969AbgJOBhq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 21:37:46 -0400
Received: from mail-vi1eur05on2060.outbound.protection.outlook.com ([40.107.21.60]:18787
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728457AbgJOBhq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 21:37:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAnPhBQCJ5Ui5T6qgNE9Ag8FjBcoP1yA7O+6XkX0CiMuyT1cPWKCqh9MjJAf2g9a13Gb6QuoFSgguRG1g3FNpN8pEn/zFrzdZrPRQmIJW+u39Q3c9zIdEQB7pN7KF4YassBa6nn0OgSuWgk9V1Uo0FOUCIPh8U+18TAcuWwsQkJTDeQK+aR70UkBruliwiLyCi7ClP5nTbEweWIDCeq2uJ1xHVfZUQe65rkM2Kyhcv2JsBcAv/ICoQyBoc46lmwuMF4rdlfqjVQN6TABK9cljZCGjwFutpobLXNhJXAiDYrz1ulFTb6DdgXGaND/v5nvEiNkvNE42TBGelT3eQviTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqVTHyc/0H0W//uWbYQ4xZjFXOeOlK8DLJkBfbkxCVk=;
 b=FEhlhXS21k5WDuTPTX4HM+fj05XQEIr+uTN/k1XPaq0MhDI9UFPIUei1vCasnDrfKweFc5E3z/24EpI5IVufo0gXp7giMadkZ13CpzSbiggN4vpEdkpf6Id8KH7scxlP9aXuI2KNzmHRtlOsy53KIwMp1ot7Ftzj/srGQqxrNVZ5l3iZ/K9/XrT2WcEJTUjHzICGeviN/35y/P7TGEUnmiTV6oX/mtmorxh/t0pDAW9CsLUufUngoFaFHnkErK20/I3RlK5bPV4RNypSt5VTGZiwUu4jdEl/m1qGZie5QSh4mqihQ67hIPTWS+ijmCBF5er0YZLHdxc6CYPKuHFaTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqVTHyc/0H0W//uWbYQ4xZjFXOeOlK8DLJkBfbkxCVk=;
 b=pFjrlkTRgXsThReD7ZWtTX2M5GSNuelFSzuYQNpPY6zY3cnNcWJvFDom4mlhkeTRqvLHELnZZq0xiPfxeVu6Vx681o6xswWapIHjzDPzM+Zveb99FZAXW2JLE0JNfMc3wC5g8n8myBq2H5cyckQ0WiBx2x7RtjmDUZyeF9GynU0=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7657.eurprd04.prod.outlook.com (2603:10a6:10:1f5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.28; Thu, 15 Oct
 2020 01:37:42 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3455.031; Thu, 15 Oct
 2020 01:37:42 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 05/13] remoteproc: Add new detach() remoteproc operation
Thread-Topic: [PATCH 05/13] remoteproc: Add new detach() remoteproc operation
Thread-Index: AQHWe8hn9jrIOSftwUG0mjM+wYkdLKmYL06w
Date:   Thu, 15 Oct 2020 01:37:42 +0000
Message-ID: <DB6PR0402MB2760E8ECEBDBFF9E02FA74D888020@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
 <20200826164529.224476-6-mathieu.poirier@linaro.org>
In-Reply-To: <20200826164529.224476-6-mathieu.poirier@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 382b98f6-cc9f-4ad6-7370-08d870aae8ed
x-ms-traffictypediagnostic: DBBPR04MB7657:
x-microsoft-antispam-prvs: <DBBPR04MB765736E2696EFC62E8A1465988020@DBBPR04MB7657.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vvV3mq5xh9Y29oce3k70YH+5Tbw8RjuPIucsufMDQ9dS+nUXYLmQlSSZBUPcVXfgI2NFwKl3OSS5zjZYqPRGnF5fE4i8s9/olHRxxF6A8iS7qzZvVAFX9VK7YBrQF62w6V+S4DSHNhdbiS7eN9EkWPL3iDqUlDLQN5jokJFWr37e4bnepbAsCu5rl6fDBQy+9KDcL16TEGNyT7K+/u9OlVXbCA4Cy1vTQg2pn3oI0k1+RMznXUbo1g8+7KbccjY0x7Lo759NYRst3Ier4Dt1U0hPc8rOGjsmt18R1y7QiMaGnjH5P5m5M/BUVdGFuI+ub1yBQzjpyn+jW0oUfao1qw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(66446008)(76116006)(44832011)(110136005)(5660300002)(54906003)(9686003)(316002)(71200400001)(2906002)(4326008)(8936002)(66946007)(64756008)(52536014)(6506007)(55016002)(7696005)(33656002)(26005)(66476007)(66556008)(478600001)(8676002)(83380400001)(186003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: oDJgGJYSxwy31vc1AjK9xLqFtaBmGwS7OKpNx9TB7rPx5nbN1dK14cM/is31m8jHWZSouqPxhOo3ZvkZHSiVH0iaJxk+Y3jcxCbi90Eel9MCvO+wVts5AgHNDHYT/SjeEQQRAybayNXfwvKTSGjSq3fVyHLRnkwu9PbuowbWgy8lYuOc/E99RGpUBkOjfbWJQp1KJJrA12+Oo3eLS2zZYjlPJjy3FgMFB4qxelZceID4EVAoTAtdKZ+58tuhOOtJe9yEL7Zzr8M0pNCiPbr7bv7JmHKGtMjGul9gtaWstxbsuJC/DWsL3jcvg1nRLDHa7Vu1gXGFDLT+/+Pngcn+sac971XbBFoxS6p6XUVYXaUlNfp9ChUfL05X+QPvmjeLLnWpjV/nkPE5v30BkTXpV7PAeCiv3G/1Q4yWTKc2Ac4onKD1L0MkyqpjeS4ek4UUMd7P9IlXSq2IKBJvJhNYFpzsvx3W+ART2J0yYuIgqDy+GKo5yHq1IgXQMcrSl5LcVuTv1KKevVtfOAw5RuGZsAqtnlpQ8uaa+nwDJA+fMbyI9gi7RxFCL4lkqEj8OfkWsZ9Z13kaYMidxrFxJGl7zA+q0R8UDcqv/kk9pqZsUv7HjzyRGJ3FDEj2KxfUTziHUyyxpwHDCcdYDTjItnAujA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 382b98f6-cc9f-4ad6-7370-08d870aae8ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2020 01:37:42.6262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0AcyYF1idX3F67JIOrpx6eOQ6EJPDiaLzzMdNTt32s8+G1Su9zwKAdAbNwapK8ayJn9Rd6OMMvPIfqcpUSg1IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7657
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH 05/13] remoteproc: Add new detach() remoteproc operation
>=20
> Add an new detach() operation in order to support scenarios where the
> remoteproc core is going away but the remote processor is kept operating.
> This could be the case when the system is rebooted or when the platform
> driver is removed.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  include/linux/remoteproc.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h inde=
x
> fe383392a821..1a57e165da2c 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -361,6 +361,7 @@ enum rsc_handling_status {
>   * @start:	power on the device and boot it
>   * @stop:	power off the device
>   * @attach:	attach to a device that his already powered up
> + * @detach:	tell the remote processor that the core is going away
>   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
>   * @da_to_va:	optional platform hook to perform address translations
>   * @parse_fw:	parse firmware to extract information (e.g. resource table=
)
> @@ -382,6 +383,7 @@ struct rproc_ops {
>  	int (*start)(struct rproc *rproc);
>  	int (*stop)(struct rproc *rproc);
>  	int (*attach)(struct rproc *rproc);
> +	int (*detach)(struct rproc *rproc);
>  	void (*kick)(struct rproc *rproc, int vqid);
>  	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len);
>  	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
> --

This look useful for i.MX8 partitioned case, M4 and A53 could reboot withou=
t
impacting the other. When A53 reboot, detach is invoked if I understand cor=
rect.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
