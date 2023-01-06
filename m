Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6EBC3DA7A
	for <linux-remoteproc@archiver.kernel.org>; Fri,  6 Jan 2023 16:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjAFQhX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 6 Jan 2023 11:37:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235330AbjAFQhW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 6 Jan 2023 11:37:22 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBFB178A4E
        for <linux-remoteproc@vger.kernel.org>; Fri,  6 Jan 2023 08:37:20 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so3946785wms.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Jan 2023 08:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2/wW8oWU2UO8G+hBvXbq+ylbwBDQdJAzgI/Jam/m+c=;
        b=P0csNwpg9MOjalR15dbOZ1LUq6TdUofEE7438rE/cpAX6qEn5+mMoWvJXJC6ZpwDXi
         EARyvmG1YWxE3zP8yqecpslPwHBQqDrVX25OOeNKcNA4wogZKUTF21SDNUxtcohel9tV
         uyrmTwytfXzK01YXqFqnvwRbqTmq1slYryNo/Rr9NvXFfeJfSIv/Vmi2tlxrQ/Vq6vX8
         2FVWVdbganGHT5PwcT5KSp1Z2Bh+9KufRjFHVx4f1iL9FdE9z650VAAIsK053hbFtN38
         WjudDhMIuOe+JqvyoB12nLnQzAfugau3CkZyjmbbxBmEnWdKrqVrcPp3S78J0Vydyz/y
         FWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G2/wW8oWU2UO8G+hBvXbq+ylbwBDQdJAzgI/Jam/m+c=;
        b=Dpj+SdjVYQLkJkEuipW7QKMxyQcg8c4cXxzFjKrgc7qeWkzcTOH4wFwtkfvGXIBshJ
         r40eNF4RfCdnVfowHLdXgFU4KUQrGik5cHIc7DdSPm/47HWE2bv5am7IMCwnDbbS3TS1
         sph62tw9djdPHm7rOKVdOzph5wj2Y5k/CK+6i4ZEZVZDJfRvrALv2CDPoWAKhEJ+nbpS
         JSmUMR/xB2dtr9rywYj1Q4H/eNsw1p3dEVHT6xjR6ma/hT1peiJwEyMI/TJg21gbaDzm
         aeRXAegVEvo9AHszAMcDyPxB2OKXlcn8rO7S1krXSTw+2o0WqRqH65IQEeAL0I9fQHQx
         fYWw==
X-Gm-Message-State: AFqh2krJqNWKwetpJv2bxpZdopbYBSIehecKK0BRrUEjCELMKzfXdWUJ
        Kn8/S6oegJyfU3i/pk2BzJ10WQ==
X-Google-Smtp-Source: AMrXdXvPO6YvRPMFNA4tbcS1PTYl42JBHmgSt22BHUKuhzVUtPqixbPCPJIe9ANjVG/6QbqyJYPZYw==
X-Received: by 2002:a05:600c:4d21:b0:3d2:2a72:2573 with SMTP id u33-20020a05600c4d2100b003d22a722573mr40022929wmp.11.1673023039183;
        Fri, 06 Jan 2023 08:37:19 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id l7-20020a5d6747000000b002b57bae7174sm1617699wrw.5.2023.01.06.08.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 08:37:18 -0800 (PST)
Message-ID: <e0ced334-e6c1-caeb-322a-f67a23ee58da@linaro.org>
Date:   Fri, 6 Jan 2023 17:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "agross@kernel.org" <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Annoying message on the console for the db845c board
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


Hi all,

Does anyone have an idea on how to fix these timeout messages ? They are 
displayed again and again every 5 seconds and that saturates the 
filesystem after awhile.

...
[   24.662181] qcom-q6v5-mss 4080000.remoteproc: start timed out
[   24.768150] qcom-q6v5-mss 4080000.remoteproc: port failed halt
[   24.777618] remoteproc remoteproc0: can't start rproc 
4080000.remoteproc: -110
[   24.785022] remoteproc remoteproc0: Boot failed: -110
[   24.833657] remoteproc remoteproc0: powering up 4080000.remoteproc
[   24.840126] remoteproc remoteproc0: Booting fw image 
qcom/sdm845/mba.mbn, size 238304
[   24.897361] qcom-q6v5-mss 4080000.remoteproc: MBA booted without 
debug policy, loading mpss
[   31.573938] qcom-q6v5-mss 4080000.remoteproc: start timed out
[   31.680229] qcom-q6v5-mss 4080000.remoteproc: port failed halt
[   31.689683] remoteproc remoteproc0: can't start rproc 
4080000.remoteproc: -110
[   31.697070] remoteproc remoteproc0: Boot failed: -110
[   31.765283] remoteproc remoteproc0: powering up 4080000.remoteproc
[   31.771758] remoteproc remoteproc0: Booting fw image 
qcom/sdm845/mba.mbn, size 238304
[   31.820553] qcom-q6v5-mss 4080000.remoteproc: MBA booted without 
debug policy, loading mpss
....

Thanks
   -- Daniel

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
