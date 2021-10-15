Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CE5C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Oct 2021 17:23:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99A9D60E97
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Oct 2021 17:23:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242352AbhJORZ0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 15 Oct 2021 13:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242393AbhJORZD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 15 Oct 2021 13:25:03 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A551C061788
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 Oct 2021 10:22:25 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id y207so14012286oia.11
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 Oct 2021 10:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Mt1pkMNHn6V/NSqy7Zfa2BsOWkNmRNfmgBOpvDCFSU=;
        b=PeyeAyvJTERLU9/cEb4LQ+rQQFvNcqwxyunKVDq1MaB3k3arSwr990iXFjXIXkvXS0
         TPydNJMwtMOxA3rE1WJjahS31eoNd8pTc3AOKVOUdjEVh3byWVgBIlWYJAj72nIc5UTx
         GMUwja8jMh4Xl91cdaO3soOfOujoE2GtMJ7GJf7XkUvrCql9v5x6hxemW1mnG0SCgc3V
         M8OjnjwXjGM3dVqyCwYTxnQYMgfv1h9rDApHgFUCZizneAGJimKVXV68m55upKtVuNMe
         X0Z2ZtPSSR21s6c0O1T/2rtIvlr/ENluc4W7ZvhTZEknX9FuftX1/sxR0mfNJXtfa8PO
         SshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Mt1pkMNHn6V/NSqy7Zfa2BsOWkNmRNfmgBOpvDCFSU=;
        b=l4LIztKkTldPNp8GLvJkACCLRNbMvDvxTz3iT9GM0pRUfc83pJricT7G059U8cJK3O
         vS9lYK5cFMfvTWeS7xHwzUGa5Z6ZwzHxJyaE9pJxZromlxO+bz7RZd8oIq6Sw/ndHYHt
         PMc0+x0rD/HZrHgONGeeXj7L6MOB2eG6Mg9gpCk4WDdfBIiHUs1PBZcxbxwcbMU5zDco
         2xw9cxUufxHYfYuMtef7yRjjI1ZgNEXzHrkeEXdombfTwnjcrnxUfcYwTH36sYZ1xnf5
         pHnzhLgaqsKTxK2HeeKxK1cx9FzjlCNVXnUimqI4bgwUI1Vnn4PneOLR5972o0POoyR5
         kAig==
X-Gm-Message-State: AOAM532IMTAKzbZJZKgy6gZ5HDsDXhCIh8FP6smxzr0jMvLoRKi6nTsC
        JbyOi2uqdEbkmaAypIHPog/+vA==
X-Google-Smtp-Source: ABdhPJw2tVTSKoItK8xIIgmh/y3S850m/4PaqqPpYagNgi9caUoiPVOiQZlZRTRpeq5lkqJgeJ88Kw==
X-Received: by 2002:a54:4d89:: with SMTP id y9mr9534060oix.127.1634318544577;
        Fri, 15 Oct 2021 10:22:24 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s206sm1289635oia.33.2021.10.15.10.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 10:22:24 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
        Colin King <colin.king@canonical.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] remoteproc: Fix spelling mistake "atleast" -> "at least"
Date:   Fri, 15 Oct 2021 12:22:14 -0500
Message-Id: <163431847249.251657.6949565960046555490.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826123735.14650-1-colin.king@canonical.com>
References: <20210826123735.14650-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 26 Aug 2021 13:37:35 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are spelling mistakes dev_err messages. Fix them.
> 
> 

Applied, thanks!

[1/1] remoteproc: Fix spelling mistake "atleast" -> "at least"
      commit: d6a33c5bdc84cc37d38e74afe0449c1192eea920

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
