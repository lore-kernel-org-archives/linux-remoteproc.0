Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AABC6FD19
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Mar 2023 21:10:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbjCMVKf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 13 Mar 2023 17:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCMVKd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Mar 2023 17:10:33 -0400
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE8AF867E8
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Mar 2023 14:09:56 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id m4so4408601lfj.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Mar 2023 14:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678741426;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ne8t/EiBvW0vN7e00XtbUoK+necbXV5F7cPmVrqdNM=;
        b=vfDLwovom/Hux1WVatvntqpmNSIeVpMCs81iulL+7XNiu7eq7tWo2RS2rehQPSjXOr
         a/wZSaPDUDM1mVHwwWdPbEFW+GGYSPQDcay4+6QeY6V8tUQOoalRmaC+z840Rh2iHLni
         NULfLLWj5RvNoFTlpbvL3uBSJhCkivwwWaH8qTJh8UK7Teii6idBhKtqsEy9PPGLAJqV
         jXCG+LLjyoPsXxje2a00d2h1n8UAR0o7Bc/P2+Nz5ffJK1yjBfgzv7BlNH9qGqhBU+ru
         Bx2xc+vFQwSabfZEOFq2hZiXlHZ3BvlmHRc0az2MD/Q7WuBanDH8M7BKqgYJVjzjBvP1
         2FJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678741426;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ne8t/EiBvW0vN7e00XtbUoK+necbXV5F7cPmVrqdNM=;
        b=po/yg478bXxe3VtCpaSntTUagFfLDeP8mCQAiq2n6gyK1Yf0lL3ny/F/n3lqwnKVFI
         4M1lR4q1Aao+wXpKFRFHV1oyxC0ikYLDijSsJf4vyhlLIK3ggDNNzJuyE6EyZI09+wYS
         8jy+BzD+PHjgJC5E1aNWC3V+M9yO8C3u3Zj27GzsMQOhwkvacTvUk/TXtJfr8NhkKnb7
         X+t9hZjKiFRZ6ZlNT3HQJRtFu0VFaKzvEmsGV7o7MHmxdQg+VMGUWuMlGoTPG4sjwE+o
         Jipo1186/uy64Gxvwvkm7qllmX/MDGAKu7DWK2zkqt3XScb2/asdLt2NQLm2PljxTYQ+
         IY+Q==
X-Gm-Message-State: AO0yUKXmasLTv7eszMcwG3C+xvHbpK410mPSZy8FBwOBhNeQIs1DYvZ9
        JNjxtBIq/56kkqNpm5r6xE2bTQ==
X-Google-Smtp-Source: AK7set+4+MDDr8Imm37JZRDfAWvvfr51MtYpj0mcq32Kq6EuEp70Ub2edl/UE0Wce4DElwi6S/mfAA==
X-Received: by 2002:ac2:44b4:0:b0:4db:1e4a:74a1 with SMTP id c20-20020ac244b4000000b004db1e4a74a1mr9472348lfm.0.1678741425726;
        Mon, 13 Mar 2023 14:03:45 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id g22-20020a19ee16000000b004d61af6771dsm101299lfb.41.2023.03.13.14.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 14:03:44 -0700 (PDT)
Message-ID: <4b6df5f4-d5e5-30f4-dc1e-a8e5f8c66363@linaro.org>
Date:   Mon, 13 Mar 2023 22:03:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: dts: qcom: sm6115: Add remoteproc nodes
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
References: <20230128054256.2100501-1-bhupesh.sharma@linaro.org>
 <5922cd55-060c-d1b1-0eb2-0875439e4268@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <5922cd55-060c-d1b1-0eb2-0875439e4268@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 13.03.2023 21:58, Bhupesh Sharma wrote:
> Hi Bjorn,
> 
> On 1/28/23 11:12 AM, Bhupesh Sharma wrote:
>> Add the adsp, cdsp and modem remoteproc nodes to sm6115.
>>
>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>> ---
>> - Depends on the dt-binding and driver change submitted via [1].
>> [1]. https://lore.kernel.org/linux-arm-msm/20230128053504.2099620-1-bhupesh.sharma@linaro.org
> 
> Gentle Ping. Since the dependencies (dt-bindings and driver changes) have already been merged into linux-next, this patch can now be applied.
Not really, it won't apply as-is. I suggest applying the version below
which was rebased, the reg was adjusted for 64bit addressing and the
-names were turned into vertical lists, I've been carrying it downstream
for a while and can confirm it works - I even got Wi-Fi up on the Tab P11!

https://github.com/SoMainline/linux/commit/a34e0bf410318b573820254bd241fef0ea013ea1.patch

(this is a git am-able plaintext patchfile)


Konrad
