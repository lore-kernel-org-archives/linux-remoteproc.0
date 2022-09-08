Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1EAC38145
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Sep 2022 02:05:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbiIHCFa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Sep 2022 22:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbiIHCF3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Sep 2022 22:05:29 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF8F7B281
        for <linux-remoteproc@vger.kernel.org>; Wed,  7 Sep 2022 19:05:28 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id z97so921512ede.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Sep 2022 19:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=NAQ8LB+hGQXgxj6b9xkh7G28EACDFrwYkoz4gLfoQ0o=;
        b=N5OgSLnSYMEWJtUWsrS9zk3nFE7VQO5+4q2NEQiEDqbANktTMjXJLAdBKzL9mHBtmU
         YexIWU2xSISmIzIESOX9i0yJCHzdt23yeYEtwld9yDI50FCz9lYQQGl2zxPHC9rAwcD5
         nE8SP9bs+3tEkAvU9L3365xt6eiKZ+BcY3p79SLErnqSEiue0/zXPdxnwZTDZNxaTUHy
         bVJqqEZbMBG7pyLnrX6ip99FBFw3jLHkz82mW7TLvUT9iIg7bnZiI7jvvj+CuS55jqeh
         0hSiswU4hG7zjLMoqJrs62h2hYGjKExZdVv/r1a48G+bgjVwWIva9mxuRtECCtmKBMQc
         0gOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=NAQ8LB+hGQXgxj6b9xkh7G28EACDFrwYkoz4gLfoQ0o=;
        b=A7FbD2ZSLMvN8Fo8erxgJkyYem9Fkg/JOVYhK17rc9NBcvL9yot29RGlfo7uW+p1HG
         BMfmuvppidFlsOTGc2ZXLew4SWbNa19ufVftPZCds/i39EEEm4pmxO5XSsm10rWG4ZRg
         AyCpyld993G2Rayk5trSvttEsNuc/VhcfV4K+QtDOKn37pfnR1QmhI+qlTftUaSsfbaz
         7xxCk0XyJFFbQQz4lQA8b+9770B8PbT5hx4lKIOzqz/7fxGfmkYO9nffE9lj1eOneXSV
         QTzcRf6MJfbF1IuV/XNVbqRcaJoEd8o/tqyLWczS4gIGXuYvtBKqCCJyQP1kbtBi/sbo
         PZ2A==
X-Gm-Message-State: ACgBeo1DhiZdDmXEOulIAVUdmSvvuOOYj/P/mqVF/7Q/r+10zpSrPKKP
        fT8cEEW8Hkx86QqZOJFmqH9Kr+2rFbfe+uef8wjP0cwujl9lOg==
X-Google-Smtp-Source: AA6agR4wf8L+5991lstrQpjJQHw23gXhsZRdqosQtkoFpKOwF0kWeZzSktqLu2ib9QdC/XOzOg9Je6L/u+giVX/Txc0=
X-Received: by 2002:a05:6402:35d0:b0:44e:ca66:7f8a with SMTP id
 z16-20020a05640235d000b0044eca667f8amr5193887edc.415.1662602726532; Wed, 07
 Sep 2022 19:05:26 -0700 (PDT)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 7 Sep 2022 20:05:15 -0600
Message-ID: <CANLsYkxEex-d=Z2QqVEBYPFocvoaRka8GLnrNfCadiwW4L6qWg@mail.gmail.com>
Subject: [INFO] Remoteproc/RPMSG patchset review order for September 8th 2022
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[PATCH v8 0/4] remoteproc: restructure the remoteproc VirtIO device
[PATCH V4 0/6] remoteproc: imx_rproc: support i.MX8QM/QXP
[PATCH 0/2] remoteproc: imx: add start up delay
[PATCH v4 0/3] Add support for WASP SoC on AVM router boards
