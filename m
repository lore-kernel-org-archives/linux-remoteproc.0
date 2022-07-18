Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9065C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jul 2022 22:59:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236370AbiGRW7o (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jul 2022 18:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236357AbiGRW7a (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jul 2022 18:59:30 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F822F023
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 15:59:26 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-10c0052da61so27856963fac.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 15:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=B31/aK7W3TCrHPuQWtF63vTS+y2Gujm3ucnWccu6dTg=;
        b=p7EmA8FV/+eeA4a1RfsYFI4uAZNgUe/pOiK2TjdDjZzSifiWH8yFm70a1Y1cHvAfBU
         DTzoE1Fut5+rz2Yfgdc/80eIYbzy14g+eawTDKkDSDzBesTaZDptbhFsQUthh8kdUvIr
         W6YkSKZ42wjZqH1WrrjYM48GHUJIT1Y2IbP5vVvonCoV5wN9AxiJGKebBmeQoMYSAy4i
         E4FSMSRNPucC5Vv7DCRY4jkE94rnwoJCcC92XGTqYiqnezCUZmN5rmp+ZNgnOZZJvuu+
         E9VO8pyacmcj4VMAQumcWwfYhZfWdhlCHawyNS6YOLdMGGq6Xy2mzO3UE2y0ftBQZfpG
         7Hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B31/aK7W3TCrHPuQWtF63vTS+y2Gujm3ucnWccu6dTg=;
        b=jjy4bL/MEYbkNuTneQVfevbgdL5d4Tm4JcDWydyvS72DHa0F4aGGoAOekScuNtvGt0
         doIV4N/nuDxfzhz2tvJMyeOjq65RrI3ucd+k6Fgx6sBmcw0Kuvu3lt+eHQonJwERxOo1
         02MWrbOMvtI/Fc4m+W3/AUq19P54TPIPKSDeVlmfJjdVKEADI5cuxBh79rWgg76UCaWA
         1ge71+DxxE1dv+3rmgnsru2pqxJwEloaLSgj/bbvHqbKwBKmxI7oGwJCB25MdEyQ95xJ
         fKD8WByMotmv6wMl52VHiOYAE+V36Q3OHjgtcuW5TP25bjStgkjaN+51EuSW/pnIbHxn
         9gFQ==
X-Gm-Message-State: AJIora+ipJYG/K4wsPmpeluzXqyC1UoL7VCISK6ihn8XNVkPAoWoO3x1
        zh1UXcFd6NZJAiElbeewN33MAPRA7DR4kg==
X-Google-Smtp-Source: AGRyM1vPPm4kJZEo7j5jkYIz0IITIlMe4kGxXtBf7+dPGXwVcRpOmbyrsE1kMQ+Eb31aKfubxulxgA==
X-Received: by 2002:a05:6870:581b:b0:10c:17cb:ebbd with SMTP id r27-20020a056870581b00b0010c17cbebbdmr18147295oap.131.1658185165336;
        Mon, 18 Jul 2022 15:59:25 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j10-20020a4a908a000000b0041ba304546csm5330931oog.1.2022.07.18.15.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 15:59:24 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mathieu.poirier@linaro.org, liuke94@huawei.com
Subject: Re: (subset) [PATCH] remoteproc: Directly use ida_alloc()/free()
Date:   Mon, 18 Jul 2022 17:59:10 -0500
Message-Id: <165817634388.1905814.6362323743133289226.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220527073832.2474641-1-liuke94@huawei.com>
References: <20220527073832.2474641-1-liuke94@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 27 May 2022 07:38:32 +0000, keliu wrote:
> Use ida_alloc()/ida_free() instead of deprecated
> ida_simple_get()/ida_simple_remove() .
> 
> 

Applied, thanks!

[1/1] remoteproc: Directly use ida_alloc()/free()
      commit: 4953012caed20e3d341085a726b97a160d8847fd

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
