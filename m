Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB55EB8FAD
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Sep 2023 06:20:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239326AbjIFGUa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Sep 2023 02:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231669AbjIFGU3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Sep 2023 02:20:29 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF7B185
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 Sep 2023 23:20:25 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99c1c66876aso480244866b.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 Sep 2023 23:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693981223; x=1694586023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=adh+U84otDp6D2XjrT9VmlnQv1geqMIUW73SkaICVTU=;
        b=RHiU0c/T8651V3YbqBCkdFm4/VeEvValgC1+E/2wCWMocevxzZsyQGUUcOaaGwSDZK
         ev8ExlKb7GNBqCQF8S9JgGoDVLWCLSMfyCGJhAbpcxUhhc6iW4YuLhzCQ45xmI7/wFzn
         IFEurR96XuXJsW3agD+O+rQga7qSP3UDLBSMlNFbMTOfv/J/fZdB4xdvVNh1LKdqTe2I
         DxyUlFrlYiotTxQt+6iv1VkaryeM+HHdioYHimeHZH9NChqifjngcGNS0h7sYJfK9a+W
         bjCWJyS/BHW7bqqCg06D5By+wzw5ztbimVrFhGZeWtS6esL8fMH9cWNgtgwCWlzxr+0Y
         6BRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693981223; x=1694586023;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adh+U84otDp6D2XjrT9VmlnQv1geqMIUW73SkaICVTU=;
        b=B8UUdxijK948e1FYghvbySqciGyWNZCf56Fkb4sIss39st71ajGRA33m7C2oJW8h88
         GdtlK/j6eIdb1itW/+QhYfD/nx7hcs/5t1/ecpbmhStzn4zIfniOxqVPBoWwBzV4g7k7
         6l6ICQN7J4B7J0+tIf6X4CvRvB2jCDrqiJv1rTrHJ7KmFSgpW20SrqYRbunSX8KE5wkd
         gzIPgc5Ow9yBM60ZHkgr95PUWb6e7pABHjoOCsVY/WhFdlq1RF/uZ8eTNedv86DmiQqc
         Xv6Eu+0vcUm338sYcdXhf4opUw0e6v6c2LoaFNuZ9z/RXYwdHYcZlF/HebNVmMkij8j9
         0LAw==
X-Gm-Message-State: AOJu0YwJElI4rvdFwOaZhZA/nwqKcfvjfDUv6bVmppNqykELQ87tB9a9
        1fK7lprBYwbQ7XkmLJSPiJuYEQ==
X-Google-Smtp-Source: AGHT+IG4ETI87Rghtciw0SPzGjlGgvKSQBl+bWvP8rr+LeMJJnzkKCMyApg0Q/K4wLu/0o/HhY43kg==
X-Received: by 2002:a17:906:8a4c:b0:9a5:d657:47ec with SMTP id gx12-20020a1709068a4c00b009a5d65747ecmr1332932ejc.64.1693981222918;
        Tue, 05 Sep 2023 23:20:22 -0700 (PDT)
Received: from [192.168.69.115] (cou50-h01-176-172-51-223.dsl.sta.abo.bbox.fr. [176.172.51.223])
        by smtp.gmail.com with ESMTPSA id i7-20020a170906850700b00993664a9987sm8503328ejx.103.2023.09.05.23.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 23:20:22 -0700 (PDT)
Message-ID: <dc5d4145-770f-3318-b026-5ce29483d384@linaro.org>
Date:   Wed, 6 Sep 2023 08:20:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v4 3/3] remoteproc: zynqmp: get TCM from device-tree
Content-Language: en-US
To:     Tanmay Shah <tanmay.shah@amd.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michal Simek <michal.simek@amd.com>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Ben Levinsky <ben.levinsky@amd.com>
References: <20230829181900.2561194-1-tanmay.shah@amd.com>
 <20230829181900.2561194-4-tanmay.shah@amd.com>
 <f6943509-25c5-b4fe-2218-638cc06a4e04@linaro.org>
 <a88a0240-30a2-4c99-baeb-091b44e4c2b7@amd.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <a88a0240-30a2-4c99-baeb-091b44e4c2b7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 5/9/23 23:48, Tanmay Shah wrote:
> 
> On 9/4/23 2:50 AM, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> On 29/8/23 20:19, Tanmay Shah wrote:
>>> Use new dt bindings to get TCM address and size
>>> information. Also make sure that driver stays
>>> compatible with previous device-tree bindings.
>>> So, if TCM information isn't available in device-tree
>>> for zynqmp platform, hard-coded address of TCM will
>>> be used.
>>>
>>> New platforms that are compatible with this
>>> driver must add TCM support in device-tree as per new
>>> bindings.
>>>
>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>> ---
>>>    drivers/remoteproc/xlnx_r5_remoteproc.c | 279 +++++++++++++++++++-----
>>>    1 file changed, 221 insertions(+), 58 deletions(-)
>>
>>
>>>    /**
>>> @@ -75,11 +79,17 @@ struct mbox_info {
>>>     * Hardcoded TCM bank values. This will be removed once TCM bindings are
>>>     * accepted for system-dt specifications and upstreamed in linux kernel
>>
>> Just curious, for how long this fall back code has to be maintained?
>> (When/how will we know we can remove it?)
> 
> 
> I believe we should never remove it. It's important that driver works with old bindings as well.

Do you mind posting a followup patch updating the comment,
to clarify?

Thanks,

Phil.
