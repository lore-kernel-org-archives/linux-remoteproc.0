Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10478C53210
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Jan 2023 23:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235096AbjADXZu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Jan 2023 18:25:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjADXZr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Jan 2023 18:25:47 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD0D1AD94
        for <linux-remoteproc@vger.kernel.org>; Wed,  4 Jan 2023 15:15:56 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id 18so11851368pfx.7
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Jan 2023 15:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q+vo9xwxFF4sNhy0dor2wwv3CWFlIdZ4y8k04+IC2tw=;
        b=Sf+AAe62Oqq7qPWS4uxFkl3QiswCdhiAOIjEAmm1kJoWKUR+7z9fwUi4k6j/ArVuCN
         BIF0iEoxuYxwW2y42amlbopuTWcSgLTF7ZZZMlkUXnJhjg4n8nGLJ+2XnlSg22N7RRH7
         26Hm1r9Y63G16hAe48x2LU+ySiL4YIELtFc3H6Ojl2ucar/oiF40Z89STfI4evDrOrVi
         z4tn0836yogPqQxVT2tEz4RJc5pVKalzScvyKVxDuAZChs1rECnkHAwWTCkK0giDHg6q
         NeU5Uh4e+6OxDFiolMq4cU1bq1Sd3qxBYGRTJbv15is8bzzbsiKTMGShROJ4cSs/ivUV
         mSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+vo9xwxFF4sNhy0dor2wwv3CWFlIdZ4y8k04+IC2tw=;
        b=gOTB+HT1DXsxtQDjHE8nKruWIzIhGtEBDSApTlLOK0l/sn0yBMo5SgCYu3BK6zfFSr
         zHwA1BOCLm6OF0bOWJQE1xcXidxaUj16QOu5Xeh3UV4FDxOgsz2X9a64uUN2rTmzycLg
         5mAzZ0iZHpCxmOrXSkTkLkcZU84yL0JiO7zEpnvHvxBVIR5coIrI8GvJpyArtxScV4It
         to/y3lILmufMOP9WR8+IG2oYFlIemkKKgYxr47/SPLnNQ8Pp4JDTSLm5CBq/HHBm1DfI
         3H+nbHRYV4zLTA8eeVfc/2vWbPfyP6K5Dij23nQKhja+hYrcBAqhtDVep3YH8546/TJt
         nLxA==
X-Gm-Message-State: AFqh2kqoigqOwPkiInoSvypR/GSjts+Zw/cg4aY3Nh3a5z31/aqPSBYA
        BOebqHv1b74+Z8KWrQOnDsTtyOyT5fDiFW85
X-Google-Smtp-Source: AMrXdXtWPhx8lX2YBKuFexnizRb7rOp4rjIGrT9SCAd9fmY3QiDyGClwqv/9WP90ncW3GQ8OaHs68g==
X-Received: by 2002:a05:6a00:2a9:b0:581:f14:fde9 with SMTP id q9-20020a056a0002a900b005810f14fde9mr32977482pfs.16.1672874155708;
        Wed, 04 Jan 2023 15:15:55 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:1328:ca09:d4c2:fcbc])
        by smtp.gmail.com with ESMTPSA id i2-20020aa796e2000000b00581172f7456sm18492509pfq.56.2023.01.04.15.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 15:15:55 -0800 (PST)
Date:   Wed, 4 Jan 2023 16:15:52 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     linux-remoteproc@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, corbet@lwn.net
Subject: Re: [PATCH v4 1/2] remoteproc: elf_loader: Update resource table
 name check
Message-ID: <20230104231552.GD2112402@p14s>
References: <1671603033-4359-1-git-send-email-quic_srivasam@quicinc.com>
 <1671603033-4359-2-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1671603033-4359-2-git-send-email-quic_srivasam@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Dec 21, 2022 at 11:40:32AM +0530, Srinivasa Rao Mandadapu wrote:
> Update the way of checking resource table name with prefix substring search
> instead of complete string search.
> 
> In general, Qualcomm DSP binary is prepared by combining different ELFs'.
> Hence, section header name (e.g. .resource_table), appended with ELF name
> to differentiate with same section(e.g. resource_table.ac_bin_process) of
> different ELFs'.
>

Well, they are different ELF files so it is implied the resource section may be
different...  And from what I see this is purely a human thing and not
specifically needed by machines.  

I can't imagine this is a new situation and as such must ask how it was working
before?

> Example readelf output of DSP binary:
>     [60] .start.ac_bin_process PROGBITS
>     [61] .resource_table.ac_bin_process PROGBITS

The real question is...  Why is this labeled ".resource_table.ac_bin_process"
rather than simply ".resource_table"?

>     [62] .comment.ac_bin_process PROGBITS
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index 5a412d7..77330d6 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -272,7 +272,7 @@ find_table(struct device *dev, const struct firmware *fw)
>  		u64 offset = elf_shdr_get_sh_offset(class, shdr);
>  		u32 name = elf_shdr_get_sh_name(class, shdr);
>  
> -		if (strcmp(name_table + name, ".resource_table"))
> +		if (!strstarts(name_table + name, ".resource_table"))
>  			continue;
>  
>  		table = (struct resource_table *)(elf_data + offset);
> -- 
> 2.7.4
> 
