Return-Path: <SRS0=Nf08=DW=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EF6C433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 01:52:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF26D22257
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 01:52:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="EpAlpwvE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729785AbgJOBwW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 21:52:22 -0400
Received: from mail-eopbgr10068.outbound.protection.outlook.com ([40.107.1.68]:20545
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729516AbgJOBwV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 21:52:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2PuhrYZo1siH9zlIQ/ZJjNuIVgkw+OxiJdDv7T9kgOlR0stW36+EYuq62K/ATViHjy8Gglt8VyjD5a6NVNqjc3ST/Eio3UNG5c+tiSA4OwilSoeHaQAYBWdfabPJxGehaxYXHEZYocleQi0SAvShc8OzkKuMFPvGGlDXNOklO6MJ90lEL0dk8ez3ox/TdN+LNwgOe6bj69oVCvC0e/0FamC5z60tGx8HBKzt9ZPuW3fJXp4yQrlompnCCtqS81kycvxg+LiJfC5ON8mbSqIPgyhTwcCySGq2gHsQqPeQt3wnSWA1oVq0FkQOSE5Vv4Ve8dbc99KQHwoBj0eGZ6chw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emwEu2MT6S1nVC7x3bgnMwbCRHItYtesiccygH8Uz1Q=;
 b=SRlV9gCCqOnB8asbMunzXQCY391h7hmUCRH+ZL1dnJ/eglFFUQSdQ7bar1GaBfj7LscXhuHuExpTqt2A1uSXqKCgSFVaG6FF/azpmb9OqDTMhm++DOIPL1d6QWLWR7M7dnfwnRDDlhKmyRVe7QGnwsWGE6jPvWVBy/wfV//oMNUR1o17eiIwGNPbsmaZThM9Gn/b6x84tWAaerIn6YTPl5hUK7wmdZslkfihaUZAFIsaCuNlMoNpcUWRXnROVv2qHSRDYfN8NNQDLBv5KwU7KtCXHO337tXbrAaU+f6WPk++UKsXJPZ9eBQ4L4qXbNzaiMwfm9FZx94Ueu+kvSkcAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emwEu2MT6S1nVC7x3bgnMwbCRHItYtesiccygH8Uz1Q=;
 b=EpAlpwvElXha/ETkuNcfQzkxHLR9YZn99Hbfc5Q/WRF77xkkE99XicJn6LXxAxKZesj2P+K8k5Y6zkSYL8YBg3y0xXIk4bU2AWNA30tuV9ee3YZ0nkoB4zUwQmTdyn2GhBO0Hygzq16m16bmmF+wlyBXaVnsLMqzjCJG/jOpK24=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7948.eurprd04.prod.outlook.com (2603:10a6:10:1e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 15 Oct
 2020 01:52:16 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3455.031; Thu, 15 Oct
 2020 01:52:16 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 07/13] remoteproc: Introduce function rproc_detach()
Thread-Topic: [PATCH 07/13] remoteproc: Introduce function rproc_detach()
Thread-Index: AQHWe8i2mWU/DvtIKUukoPNylpfuWqmYM7Ng
Date:   Thu, 15 Oct 2020 01:52:16 +0000
Message-ID: <DB6PR0402MB2760F33EF3C3BF69D737899688020@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
 <20200826164529.224476-8-mathieu.poirier@linaro.org>
In-Reply-To: <20200826164529.224476-8-mathieu.poirier@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9e35793c-8cf5-4f6b-b2bd-08d870acf1a5
x-ms-traffictypediagnostic: DBBPR04MB7948:
x-microsoft-antispam-prvs: <DBBPR04MB7948C2CA7482819A5F55264188020@DBBPR04MB7948.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:972;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OVUuIc0IxLewXa8dxnzFWtO2mTY7ML9P+eGuMSkWiFWSk1nY/iPPm/X2pxzjw8EY4CkMh1ZFIRa28hKDK5PifZHR0dS1xXkzJ75PCaWzNEqso2/i+vBd1GhowwWG1gB235ZG8BhdqnMhoxLwsh7P1pnYZvfsiRH0tVuRU4JYh23ictyiHE8lucMTT/FiHJQk29CPqIOmE7PJhYAJjOiNVxOHiGT7XhWbnqLfMZPxojU+TY8uC4amqg36WrJtmeRIFoBFnW7t3dhsgLML/mMWSPyy5Lu/Dni0EANW14ZmoMSkKn4ZYGHP8xwgeyrd3sy7mDJo2Oy8OAdhV582/kDkEA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(66556008)(110136005)(44832011)(54906003)(26005)(71200400001)(66446008)(478600001)(66476007)(316002)(64756008)(9686003)(8676002)(55016002)(66946007)(8936002)(186003)(33656002)(5660300002)(7696005)(76116006)(6506007)(2906002)(4326008)(52536014)(86362001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: VH0GTOhVbqJFdi1I2PRqrFdQLr7g6Z9O3Vo++Sg/SuHkGyHPdTROPGC3QIGqizXijqgoJPTdNx9xOkesSaF1j6FGB7u2hlfi97r8ipenT4d8tVSNOdXRRiESCnS9D+9XsfvGmSGd4kaJjtlxivzA8IrMFCtG6aVzkueM00GNuGqwkC38mjCUpv7AYx7r0Twl1ocWObh3KkFsKp2WGneUC919JC2hTw/PQQEBDeT5iy1rQ26pa/jzYWjf1P78/ppmoQFa+K0zMCZgUILDKBZ5Crfll1brpHunGpeo+rS8L+aR2yhAOVa2RE8wgjRBMdPZASkk2WjhD+aqQTYNxiPv366S99siGwNMX9JMjvgHFW0OeszVxg5oEDzIvTwyoEz7RCN1vSh4mQ6srSspPO6OK0dd+995FSK5mtzYaN5ST7FZolqQiyKYpRd41GshuEQDx+BGjEV+f5AiKE8fc/fueB2ShFgmXI2THF2ZiyypWFbvIq5lTHSdLWiBSOLNBOkRBpUuALC1zIaeOSuaWW+fegYHe+l6jhJ8JbskjB0geKjtC/JKd53jHpuYYsbcXjvVAuoaVIPpOZT+Ay1d6f4bFedWIt31BzBwXb1IWk9snWnvA+Iak2lYMm2C8FuNJ0WSk/H7SazSasMpgySOD97PXw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e35793c-8cf5-4f6b-b2bd-08d870acf1a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2020 01:52:16.2309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LtdtamGG+mC1sRMNx2ahbslpHTPWLKYG65pYs3K/DJCHm/tb5zAsvP6mczQX+ZvqJdwZ620qkVv7LwGQypvpAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7948
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH 07/13] remoteproc: Introduce function rproc_detach()
>=20
> Introduce function rproc_detach() to enable the remoteproc core to releas=
e
> the resources associated with a remote processor without stopping its
> operation.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 65
> +++++++++++++++++++++++++++-
>  include/linux/remoteproc.h           |  1 +
>  2 files changed, 65 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index 7a1fc7e0620f..f3943a1e2754 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1644,7 +1644,7 @@ static int rproc_stop(struct rproc *rproc, bool
> crashed)
>  /*
>   * __rproc_detach(): Does the opposite of rproc_attach()
>   */
> -static int __maybe_unused __rproc_detach(struct rproc *rproc)
> +static int __rproc_detach(struct rproc *rproc)
>  {
>  	struct device *dev =3D &rproc->dev;
>  	int ret;
> @@ -1887,6 +1887,69 @@ void rproc_shutdown(struct rproc *rproc)  }
> EXPORT_SYMBOL(rproc_shutdown);
>=20
> +/**
> + * rproc_detach() - Detach the remote processor from the
> + * remoteproc core
> + *
> + * @rproc: the remote processor
> + *
> + * Detach a remote processor (previously attached to with rproc_actuate(=
)).
> + *
> + * In case @rproc is still being used by an additional user(s), then
> + * this function will just decrement the power refcount and exit,
> + * without disconnecting the device.
> + *
> + * Function rproc_detach() calls __rproc_detach() in order to let a
> +remote
> + * processor know that services provided by the application processor
> +are
> + * no longer available.  From there it should be possible to remove the
> + * platform driver and even power cycle the application processor (if
> +the HW
> + * supports it) without needing to switch off the remote processor.
> + */
> +int rproc_detach(struct rproc *rproc)
> +{
> +	struct device *dev =3D &rproc->dev;
> +	int ret;
> +
> +	ret =3D mutex_lock_interruptible(&rproc->lock);
> +	if (ret) {
> +		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
> +		return ret;
> +	}
> +
> +	if (rproc->state !=3D RPROC_RUNNING && rproc->state !=3D
> RPROC_ATTACHED) {
> +		ret =3D -EPERM;
> +		goto out;
> +	}
> +
> +	/* if the remote proc is still needed, bail out */
> +	if (!atomic_dec_and_test(&rproc->power)) {
> +		ret =3D -EBUSY;
> +		goto out;
> +	}
> +
> +	ret =3D __rproc_detach(rproc);
> +	if (ret) {
> +		atomic_inc(&rproc->power);
> +		goto out;
> +	}
> +
> +	/* clean up all acquired resources */
> +	rproc_resource_cleanup(rproc);
> +
> +	rproc_disable_iommu(rproc);
> +
> +	/*
> +	 * Set the remote processor's table pointer to NULL.  Since mapping
> +	 * of the resource table to a virtual address is done in the platform
> +	 * driver, unmapping should also be done there.
> +	 */
> +	rproc->table_ptr =3D NULL;
> +out:
> +	mutex_unlock(&rproc->lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL(rproc_detach);
> +
>  /**
>   * rproc_get_by_phandle() - find a remote processor by phandle
>   * @phandle: phandle to the rproc
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h inde=
x
> 1a57e165da2c..6250491ee851 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -656,6 +656,7 @@ rproc_of_resm_mem_entry_init(struct device *dev,
> u32 of_resm_idx, size_t len,
>=20
>  int rproc_boot(struct rproc *rproc);
>  void rproc_shutdown(struct rproc *rproc);
> +int rproc_detach(struct rproc *rproc);
>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)=
;
> int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t
> size);  int rproc_coredump_add_custom_segment(struct rproc *rproc,
> --


Reviewed-by: Peng Fan <peng.fan@nxp.com>

Not relevant to your patch, just see unregister_virtio_device not set devic=
e
status when reading code, should that add device status setting in
unregister_virtio_device?


