Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF9E7C43334
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jul 2022 22:59:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236467AbiGRW7v (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jul 2022 18:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236315AbiGRW7m (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jul 2022 18:59:42 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B250D3334F
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 15:59:27 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id by10-20020a056830608a00b0061c1ac80e1dso10445724otb.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 15:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=drVbYFCYCk/XQG0CX+PIBYqM5tVWSeGrCuK4ayZqjI8=;
        b=yvGhiLU6RqpjMMCknxnSJ4gPB/3V30LSI22dDmEfoSyfDUMkVNG/cFgEEUQgvOR0K6
         kCxonVamWXjxv/EQO8Pdr7A/LerxgRtRrPGuv+Tic4VNIduA1AAYpsus5dS/TWmXCvjr
         cIe5b/c30qLa5ogEJIVYVCj5BFpfi7HUNQo98kJ0dAWvRyEQmdACp9l9+YaUcE/aFqE8
         U5inOmYED1Dn4jC5ZYC82tFSgM7u0UVzmtS4C2xkMLR87jhAulmy0Q+B6qsqEZFuwzcc
         snZQ/RzovSogVtsH/enUNzCBWGLTvqhNtYIjc6EanR09lKx7WdJpaLlnbY/Hv5L6R4PI
         wT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=drVbYFCYCk/XQG0CX+PIBYqM5tVWSeGrCuK4ayZqjI8=;
        b=DxtD9ercHy24u4eOoqIXYSQkOtvB0IV9r00dfR3Q2oBOuh+xK0plZooDLmeXNd27sf
         KqgTvLWbUlPAy9jZ8ZewuoUhrEzw6vHx3fXuWhP379aD4pmJhCNJXOYK6FwB7D4F0GOq
         OxnayTwKg9Zm+oQ3exzmPcGOumbLGvx5nlDzgAY6AEAWK8btJj/PiK+9emIVoyiOzrSX
         Kfiz6b9MEdJXGD0QrIa70S0GmVmhMFrcV0FRk45pJxz33msoE1bk/qW9A3aqnPFUZiSf
         ggdj81OpCwGsX5tGP8zRW/ztMr473NddDdKp7YuZTxsb0uaLssglwJystrhQZiMJp1/q
         gajQ==
X-Gm-Message-State: AJIora+fMn6LFl4JqR7EFJZmoayh9V3LEtfHQ0lL2AWEDGbT4g2c36cD
        YeOZCTKj9/MKBpmTzwrkdyAhxg==
X-Google-Smtp-Source: AGRyM1sJO6vupjFVRGWI2o1CliQD5fT+a760+JSu3pSoDFN1qKMkU5VMw6APLkhmLazAFfY/ndPYbw==
X-Received: by 2002:a05:6830:44a2:b0:61c:71ad:b7f4 with SMTP id r34-20020a05683044a200b0061c71adb7f4mr11009629otv.290.1658185167338;
        Mon, 18 Jul 2022 15:59:27 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j10-20020a4a908a000000b0041ba304546csm5330931oog.1.2022.07.18.15.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 15:59:26 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>, quic_sibis@quicinc.com
Cc:     linux-kernel@vger.kernel.org, mka@chromium.org, agross@kernel.org,
        sboyd@kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v2] remoteproc: qcom_q6v5_mss: map/unmap metadata region before/after use
Date:   Mon, 18 Jul 2022 17:59:12 -0500
Message-Id: <165817634386.1905814.1933035759281220435.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <1652248625-990-1-git-send-email-quic_sibis@quicinc.com>
References: <1652248625-990-1-git-send-email-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 11 May 2022 11:27:05 +0530, Sibi Sankar wrote:
> The application processor accessing the dynamically assigned metadata
> region after assigning it to the remote Q6 would lead to an XPU violation.
> Fix this by un-mapping the metadata region post firmware header copy. The
> metadata region is freed only after the modem Q6 is done with fw header
> authentication.
> 
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom_q6v5_mss: map/unmap metadata region before/after use
      commit: 8808fc4008e3bb70bfe682c41d8c0d8626d1ec0b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
