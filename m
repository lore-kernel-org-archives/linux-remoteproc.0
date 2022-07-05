Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79DEC433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Jul 2022 16:44:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbiGEQom (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Jul 2022 12:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231769AbiGEQol (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Jul 2022 12:44:41 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7DE9C1B
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 Jul 2022 09:44:40 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id s21so8174024pjq.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 Jul 2022 09:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eLgml7wSqf63i8QKqavHdfBKu65SGTRMU0zAE0A8Gro=;
        b=L3PxmXdaLTjNaaXfqG64jVu2kWycf/WdmNEvgUeUz8ylOX7RH4pvRAEwyG479e9en/
         bDOh0IpGIbpA4za5jmhUd7zLwJo6RzCX9wzPW83GHWzjKA3a0bRVzsp4QZ+5UTMnTXw+
         4Fh95neopPitrCv8hR9He6fj5HhCx/h2dUDMs56SF4Y3HyRfnGqUSvJk3zVMu0HG+tRK
         vJqhxMt2q3XYvuCrzTLwivkxsvuY+0lgIkJQ9m0jMsxtQkyAYaxJkdppeutZDcKWHeg8
         Fjyk+Ql5yUg+L45MlEpE8EaxPj5AtXlBWBmi73+O2lrXoz7sUt9mofgyxhSG1f7kzUWQ
         MDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eLgml7wSqf63i8QKqavHdfBKu65SGTRMU0zAE0A8Gro=;
        b=ccigGq1DvwHk+O/zCY+a1fkLAV9OAsOLw0NG6H0pl9pBEH56oNQN6Gimvj/Xlxe/OL
         fG+PAOV7uy93rJ7FwXYBT0mQdQdhIQAbC/CW2RCcPyWfhDRTimZygOalKSP6i7/arZax
         GkN8VTaNiSjsEAJJ1SA9503anbp9ByreltYgrRyitLlYxr7RgV7nz3A2Qo/PX/mvpfvZ
         okekGBQZ4nNaE0dsDjS2WKuoivW0HeGAPONE8PV6HLqmRQ69xqB9GPTE7nRY2LqwR99V
         EC8mlN+Oi+lPtEi4QvaP8sHR3gmwqUQ5bb2XjnXmv+KNN11ATxRmQTOy/Q1hqoLMIy7I
         loRg==
X-Gm-Message-State: AJIora+hOCHBvwsWI6u8LnhCLxFLyuuHak4uZSkcXAHoGLdQsMYVWonA
        X+W06FMOZd/20AX9oQ1Ih/XsVg==
X-Google-Smtp-Source: AGRyM1vIEL7g2JbVjG7B+hWQi1J4TzibjdTDXl464exty9BLy/HIy5ENYXacjU2ODoDjd3/7/Hwdsw==
X-Received: by 2002:a17:90b:3d81:b0:1ef:a950:a0cd with SMTP id pq1-20020a17090b3d8100b001efa950a0cdmr404122pjb.43.1657039480255;
        Tue, 05 Jul 2022 09:44:40 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id m17-20020a170902db1100b0016a275623c1sm16071929plx.219.2022.07.05.09.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 09:44:39 -0700 (PDT)
Date:   Tue, 5 Jul 2022 10:44:37 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] remoteproc: pru: Add support for various PRU
 cores on K3 AM62x SoCs
Message-ID: <20220705164437.GA2443558@p14s>
References: <20220602101920.12504-1-kishon@ti.com>
 <20220602101920.12504-4-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602101920.12504-4-kishon@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jun 02, 2022 at 03:49:20PM +0530, Kishon Vijay Abraham I wrote:
> The K3 AM62x family of SoC has one PRUSS-M instance and it has two
> Programmable Real-Time Units (PRU0 and PRU1). This does not support
> Industrial Communications Subsystem features like Ethernet.
> 
> Enhance the existing PRU remoteproc driver to support the PRU cores
> by using specific compatibles. The initial names for the firmware
> images for each PRU core are retrieved from DT nodes, and can be adjusted
> through sysfs if required.
> 
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  drivers/remoteproc/pru_rproc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 1777a01fa84e..128bf9912f2c 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -897,6 +897,7 @@ static const struct of_device_id pru_rproc_match[] = {
>  	{ .compatible = "ti,j721e-pru",		.data = &k3_pru_data },
>  	{ .compatible = "ti,j721e-rtu",		.data = &k3_rtu_data },
>  	{ .compatible = "ti,j721e-tx-pru",	.data = &k3_tx_pru_data },
> +	{ .compatible = "ti,am625-pru",		.data = &k3_pru_data },

I have applied this set.

Thanks,
Mathieu

>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, pru_rproc_match);
> -- 
> 2.17.1
> 
