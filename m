Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4327CC433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 May 2022 07:20:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234613AbiESHUX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 May 2022 03:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234485AbiESHUV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 May 2022 03:20:21 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50F266F4BC
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 May 2022 00:20:20 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id h29so7570846lfj.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 May 2022 00:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=fdfSYz0vm9MQWJbSUfogROrxBfQQh8tD8bxvI5Fs7cI=;
        b=bbtch6XAWiN/DV2yOgt38hEl0PAk2t1n0PBAqWjkC07CKF2r50NEYLvYe/ajQO6DcL
         d9DV1AvR3EEGEbk+0vYrhRy1NQt960fzcROv5qDeTy8ne3IGxckoRyzheI5dPQTxIz7S
         UDF0rSA/3Cw7cMLZSIEDIk8uT1p2/71/hxT0yY0TFc3355n0CoxymE3WFNU9DT4nF2tv
         FeewUQe0FPJz7aNuzhm9YORUey8hvLIl6ZpXV8DNGWm4EFvUT54sLBjnSLPvvdSYcjzG
         3fk+BeIaVq33X9s6Z8kZVHoxNPECcQJqPwiTBpC7EIiPR8lsD56zFJoYiju+wtUpYs+e
         X7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fdfSYz0vm9MQWJbSUfogROrxBfQQh8tD8bxvI5Fs7cI=;
        b=TzmNgWBr1E20WGQJiBAKyrveR4Q1rFNnNX/1Nlr8pMZ4Uhh1aqTR2rRleB01Jus6A7
         DhwkBEnJ/SGtBjGCM76kMH4FPtqHU7XUa0/281xpgQlHr29hq6cJ/eSZFVgNOcMh8EJZ
         z44SZZ42O1azMekBUlZmX8mg3d3GOw+uYPoBkCfrX2rGtKGOYMRptXhUpk/PDQNyCtJb
         E89qcCEUNTMxar3ikG9Fy7y4UrSAWe81WffYEXgR9N1YCzMaLjsztoGALQSFPFutZ2jy
         Ux4lprzImFOh/fzU0CnwZGsTM27SjEbcvX1lY3VIAUVoLydjkbUPZR9pkmJoW3NdArW2
         rutg==
X-Gm-Message-State: AOAM532SAOEpqnm2T+VqHNorH9Z+94bbHmCbgOlZcOhKQ0CNZoEZW1aC
        gJS/3KEEOeKCeRcDG6+u4cO11w==
X-Google-Smtp-Source: ABdhPJxoi/rsKjcwuY1nKxd+QQG6REhVdwGjY1Dy9hu/ZPzMp0gtsds4YLqAgc7BAe5dP8hSj4xH2Q==
X-Received: by 2002:a05:6512:1585:b0:448:3936:a5a0 with SMTP id bp5-20020a056512158500b004483936a5a0mr2318972lfb.108.1652944818555;
        Thu, 19 May 2022 00:20:18 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t1-20020a2e9c41000000b0024f3d1daeb1sm479424ljj.57.2022.05.19.00.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 00:20:18 -0700 (PDT)
Message-ID: <4b295be3-ae3b-f977-6922-d1505b7843f0@linaro.org>
Date:   Thu, 19 May 2022 09:20:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/8] firmware: qcom_scm-legacy: correct kerneldoc
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
 <20220501103520.111561-2-krzysztof.kozlowski@linaro.org>
 <20220519000350.DD5C0C385A9@smtp.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220519000350.DD5C0C385A9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 19/05/2022 02:03, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2022-05-01 03:35:14)
>> diff --git a/drivers/firmware/qcom_scm-legacy.c b/drivers/firmware/qcom_scm-legacy.c
>> index 1829ba220576..7854af4abc62 100644
>> --- a/drivers/firmware/qcom_scm-legacy.c
>> +++ b/drivers/firmware/qcom_scm-legacy.c
>> @@ -120,6 +120,9 @@ static void __scm_legacy_do(const struct arm_smccc_args *smc,
>>  /**
>>   * scm_legacy_call() - Sends a command to the SCM and waits for the command to
>>   * finish processing.
>> + * @dev:       device
>> + * @desc:      descriptor structure containing arguments and return values
>> + * @res:        results from SMC/HVC call
> 
> I think only SMC call is possible so drop HVC to not be confusing.

Sure.


Best regards,
Krzysztof
