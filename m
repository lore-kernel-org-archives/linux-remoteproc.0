Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F8EC7EE45
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Jun 2023 15:24:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbjFIPY4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Jun 2023 11:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241445AbjFIPYz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Jun 2023 11:24:55 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F5E3586
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Jun 2023 08:24:53 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f63ea7bfb6so2356105e87.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Jun 2023 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686324291; x=1688916291;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lRuvvrDKcdKgqOVBHNcNpprNH0PudwKN/1RDA8qIH0I=;
        b=tRdRMg/OoG+dUeftshGoSSoR2PvpxNqcaL9rAt0NWvM22Z+fx5obL0N4/9BwiPjpEw
         4Av0V2gMK3m7rcLn36X8h+3W9ns8UiJWr3ZCH/PbO+5TaaYh3pWixL1PZlSckYJ+Uzf7
         b/lEeFAYAzv3nTCpbXkeijaysfOe+L4xxivkSMgtcn2Cifz4zljuS5tHGYAl1kvBQLw5
         NqHMTSCp9B4DLPF7HiM6vNXFj6ibYobJy/NIbUS86UREHbDVMUQOipLC44zmIktor5Fj
         dNX6/SzXfLboSIPHhSI8phReQMFcivsAnTEtRYDf0/s1loS5HTpPqDz3Bv561FQ486jn
         kr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686324291; x=1688916291;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lRuvvrDKcdKgqOVBHNcNpprNH0PudwKN/1RDA8qIH0I=;
        b=PcFGA3+8YzvkkRsjDLX5IMO0wsxBANy+3XuOjJuUPbgV7amcicf28en3tvDiEj/+pv
         NVqyWaXV/uRABUMNpJ6cshQSedlLzdIY1zGhZF+XgPHFACJJQe9fZc4H0nGpeLf1YYei
         M/j5z9zQkkMCQHbrmopZW6aZ97LlKYxysmd6nN7TQHc2C62Vh9P2/5qGGrZ4zUZ5C+gy
         mB5R+I6tjb8taR/rfAYbZsGyEgztdmzzTARxGoR1tT0kuba9d/aYxvqUY6w7FKWMIhv/
         NH1qsfKzJ5cYxGbjNeDbRtK8JRiN/TgWeJFsJnnGhAsCbTxBFsjpxOnN5D6sRRYRAffg
         Uy9Q==
X-Gm-Message-State: AC+VfDw8w+vZ7xJSjiyIIei9HQ8ePPQeD7n8M+kCRFSUBeCC2C+/DtGK
        jg0voZ3AarzoWTe5/gQnFkd/Gg==
X-Google-Smtp-Source: ACHHUZ4QjjRROqZmGBNQkmEIZBM5wLkuRQqtjNyHO0vNSAiAw5Ps1GaX1kOEgREwRgkxOBJuMoeoxA==
X-Received: by 2002:a05:6512:2f5:b0:4f3:8260:f18c with SMTP id m21-20020a05651202f500b004f38260f18cmr1088488lfq.57.1686324291531;
        Fri, 09 Jun 2023 08:24:51 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id d13-20020ac24c8d000000b004eff10511besm578395lfl.146.2023.06.09.08.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 08:24:51 -0700 (PDT)
Message-ID: <cf296298-f122-a316-b8ed-118990374b71@linaro.org>
Date:   Fri, 9 Jun 2023 17:24:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 08/12] soc: qcom: Add RPM processor/subsystem driver
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230531-rpm-rproc-v2-0-56a4a00c8260@gerhold.net>
 <20230531-rpm-rproc-v2-8-56a4a00c8260@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230531-rpm-rproc-v2-8-56a4a00c8260@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 8.06.2023 09:10, Stephan Gerhold wrote:
> Add a simple driver for the qcom,rpm-proc compatible that registers the
> "smd-edge" and populates other children defined in the device tree.
> 
> Note that the DT schema belongs to the remoteproc subsystem while this
> driver is added inside soc/qcom. I argue that the RPM *is* a remoteproc,
> but as an implementation detail in Linux it can currently not benefit
> from anything provided by the remoteproc subsystem. The RPM firmware is
> usually already loaded and started by earlier components in the boot
> chain and is not meant to be ever restarted.
> 
> To avoid breaking existing kernel configurations the driver is always
> built when smd-rpm.c is also built. They belong closely together anyway.
> To avoid build errors CONFIG_RPMSG_QCOM_SMD must be also built-in if
> rpm-proc is.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soc/qcom/Kconfig    |  1 +
>  drivers/soc/qcom/Makefile   |  2 +-
>  drivers/soc/qcom/rpm-proc.c | 77 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 79 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index e597799e8121..715348869d04 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -191,6 +191,7 @@ config QCOM_SMD_RPM
>  	tristate "Qualcomm Resource Power Manager (RPM) over SMD"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on RPMSG
> +	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
>  	help
>  	  If you say yes to this option, support will be included for the
>  	  Resource Power Manager system found in the Qualcomm 8974 based
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index 99114c71092b..113b9ff2ad43 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -18,7 +18,7 @@ obj-$(CONFIG_QCOM_RPM_MASTER_STATS)	+= rpm_master_stats.o
>  obj-$(CONFIG_QCOM_RPMH)		+= qcom_rpmh.o
>  qcom_rpmh-y			+= rpmh-rsc.o
>  qcom_rpmh-y			+= rpmh.o
> -obj-$(CONFIG_QCOM_SMD_RPM)	+= smd-rpm.o
> +obj-$(CONFIG_QCOM_SMD_RPM)	+= rpm-proc.o smd-rpm.o
>  obj-$(CONFIG_QCOM_SMEM) +=	smem.o
>  obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
>  obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
> diff --git a/drivers/soc/qcom/rpm-proc.c b/drivers/soc/qcom/rpm-proc.c
> new file mode 100644
> index 000000000000..2995d9b90190
> --- /dev/null
> +++ b/drivers/soc/qcom/rpm-proc.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2021-2023, Stephan Gerhold <stephan@gerhold.net> */
> +
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/rpmsg/qcom_smd.h>
> +
> +static int rpm_proc_probe(struct platform_device *pdev)
> +{
> +	struct qcom_smd_edge *edge = NULL;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *edge_node;
> +	int ret;
> +
> +	edge_node = of_get_child_by_name(dev->of_node, "smd-edge");
> +	if (edge_node) {
> +		edge = qcom_smd_register_edge(dev, edge_node);
> +		of_node_put(edge_node);
> +		if (IS_ERR(edge))
> +			return dev_err_probe(dev, PTR_ERR(edge),
> +					     "Failed to register smd-edge\n");
> +	}
> +
> +	ret = devm_of_platform_populate(dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to populate child devices: %d\n", ret);
> +		goto err;
> +	}
> +
> +	platform_set_drvdata(pdev, edge);
> +	return 0;
> +err:
> +	if (edge)
> +		qcom_smd_unregister_edge(edge);
> +	return ret;
> +}
> +
> +static void rpm_proc_remove(struct platform_device *pdev)
> +{
> +	struct qcom_smd_edge *edge = platform_get_drvdata(pdev);
> +
> +	if (edge)
> +		qcom_smd_unregister_edge(edge);
> +}
> +
> +static const struct of_device_id rpm_proc_of_match[] = {
> +	{ .compatible = "qcom,rpm-proc", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rpm_proc_of_match);
> +
> +static struct platform_driver rpm_proc_driver = {
> +	.probe = rpm_proc_probe,
> +	.remove_new = rpm_proc_remove,
> +	.driver = {
> +		.name = "qcom-rpm-proc",
> +		.of_match_table = rpm_proc_of_match,
> +	},
> +};
> +
> +static int __init rpm_proc_init(void)
> +{
> +	return platform_driver_register(&rpm_proc_driver);
> +}
> +arch_initcall(rpm_proc_init);
> +
> +static void __exit rpm_proc_exit(void)
> +{
> +	platform_driver_unregister(&rpm_proc_driver);
> +}
> +module_exit(rpm_proc_exit);
> +
> +MODULE_DESCRIPTION("Qualcomm RPM processor/subsystem driver");
> +MODULE_AUTHOR("Stephan Gerhold <stephan@gerhold.net>");
> +MODULE_LICENSE("GPL");
> 
