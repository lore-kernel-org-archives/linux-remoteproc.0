Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE267CA0EEB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Sep 2023 21:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240735AbjIKVaI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Sep 2023 17:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236638AbjIKLHO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Sep 2023 07:07:14 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C432BCF0
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Sep 2023 04:07:07 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so70629161fa.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Sep 2023 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694430426; x=1695035226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qmyHVYJDP9hmCywHRnsdxnvZ1q0Z/z3sEq/O/fzkRmM=;
        b=hE0UzNOildrc4RtjQlC+RP8Kk8xdx6Ya+Ekn5wJ/mahURugJQ378ozWVwxwNvye0ph
         n92OzvajmrHal2Bn5EWHx+95chi40L9o3jccAVeRv0cWfirw9o2FReWCjrqyQDPaQsL2
         kL35iYvgHu2HQic9ztnDQNByUaZh/NcvITlULH8CTBJRhweieQxtH23b2TLKg4Y+jM7v
         SF3seT8EA/gqrFfcrQLBm0BZuVwjMXfKewd/h0Fbh8HIh1pgftR85XVP5n6/bFl9iWiK
         qALytUgT8moTF5mvDYaQ6tSZXqrXDBYb7NY8KVlEXa4Az+fhGxlY1QchZMBnD5QIdm0o
         qBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694430426; x=1695035226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qmyHVYJDP9hmCywHRnsdxnvZ1q0Z/z3sEq/O/fzkRmM=;
        b=u79waPbGbUgn/UDtUJFZU/HxOYirEIe+BWuzKbv8SclKQi5MgSuyrJceWPbySfJefJ
         4PW4oO35b+2VbIKsD9y7QDVuAWjxGiUwTapnBQ+KLGHzmaz+4WRP3Xc42ZL23Rlhloze
         0zAVsJdhGSXShgJrwevXC+XLGelhfglmD0//sffzDSqhaUM/bIYfrgtq4toQR/a6Togs
         Vj90GyuTDnOlYPGB2vvaNnSIpxedAT3RtrP1ZiPfwug94+ugzsTKdMMn8HjfIMTggqvP
         wX5cTAlhNZqUL3Y7pzb6Fmn7HvRMZsqCH3p5WYfl5eccNCTUphjXueGEIvew1dLLJFmb
         Uvbg==
X-Gm-Message-State: AOJu0YxJobWss5x9B7uMikd3KYlejTJszTtSn7sJwiIIxwmJ++8bjQH0
        WsNfqoTDFttNu6sy42GDduROiQ==
X-Google-Smtp-Source: AGHT+IFR8IFxIJ7reSkaYfAFLu1yRY1oO/AEBb0QIMYpht4GuEFk0sZxNE+qAxMWLhq3G4SDtzJ7xQ==
X-Received: by 2002:a2e:9ed7:0:b0:2bd:124a:23d5 with SMTP id h23-20020a2e9ed7000000b002bd124a23d5mr8252127ljk.11.1694430425888;
        Mon, 11 Sep 2023 04:07:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id qn6-20020a170907210600b0099d9b50d786sm5219726ejb.199.2023.09.11.04.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:07:04 -0700 (PDT)
Message-ID: <e35a8b4f-ba1a-514e-9c59-a74442f0cb1f@linaro.org>
Date:   Mon, 11 Sep 2023 13:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 06/17] soc: qcom: Add Qualcomm APSS minidump kernel
 driver
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, corbet@lwn.net,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, keescook@chromium.org, tony.luck@intel.com,
        gpiccoli@igalia.com, mathieu.poirier@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, vigneshr@ti.com, nm@ti.com,
        matthias.bgg@gmail.com, kgene@kernel.org, alim.akhtar@samsung.com,
        bmasney@redhat.com, quic_tsoni@quicinc.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@quicinc.com
References: <1694290578-17733-1-git-send-email-quic_mojha@quicinc.com>
 <1694290578-17733-7-git-send-email-quic_mojha@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1694290578-17733-7-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 09/09/2023 22:16, Mukesh Ojha wrote:
> +/**
> + * qcom_minidump_region_register() - Register region in APSS Minidump table.
> + * @region: minidump region.
> + *
> + * Return: On success, it returns 0 and negative error value on failure.
> + */
> +int qcom_minidump_region_register(const struct qcom_minidump_region *region)
> +{
> +	struct minidump *md;
> +	int ret;
> +
> +	md = qcom_smem_minidump_ready();
> +	if (!md)
> +		return -EPROBE_DEFER;
> +
> +	if (!qcom_minidump_valid_region(region))
> +		return -EINVAL;
> +
> +	mutex_lock(&md->md_lock);
> +	ret = qcom_md_region_register(md, region);
> +	if (ret)
> +		goto unlock;
> +
> +	qcom_md_update_elfheader(md, region);
> +unlock:
> +	mutex_unlock(&md->md_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_minidump_region_register);

NAK, there is no user for this.

Drop all exports from minidump drivers. Your upstream driver *must not*
expose stuff to your vendor drivers.

Best regards,
Krzysztof

