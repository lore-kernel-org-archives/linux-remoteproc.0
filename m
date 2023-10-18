Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E7ACDB47E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Oct 2023 19:27:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjJRT13 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Oct 2023 15:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjJRT13 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Oct 2023 15:27:29 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 802C7AB
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Oct 2023 12:27:27 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4056ce55e7eso66315205e9.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Oct 2023 12:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697657246; x=1698262046; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NOYaWQXpl1rzC48S5uz0mFgMMvgScc3wxGAv+ZODYeo=;
        b=R3PJf+EONS+7upc3Cn9wNrJYvLqmIYY1EIG92TSpGD7/L1x1wpgvvUOrlZVoX3F91+
         zERP335lQD1uxA+FmrSS7wr30ltclhd6JZZbyxXrb5dpjwEGpbRW9E49PRnlchm1V5Nc
         maI0kxtYvlbm1sm0+C1dwuiX+R4x89LZJr5NNWsWe4C3+d/QWDct3v8cx6MMyyTPAU2j
         d/+gyapoPrcJunVUWP/Mw3oQ3M3m2BU2uz8Yw9Suj0MNRWfSTapQTLe4rsyRrTie/Xa0
         UjtwWu+svJR8C7BJ5jF7WAt686YSmDUbrB/H5bd2wcBtXdQXASEzLO4yQn3LB4Yctnyi
         rtrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697657246; x=1698262046;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOYaWQXpl1rzC48S5uz0mFgMMvgScc3wxGAv+ZODYeo=;
        b=DUlTvFDfLNhVDSkplWL9MUcWs4AQW/wLVqextq70q2BsQjSpJdtbrSHOhs49E8QLMb
         XS8NtsitR8f0k3A46IO3LAMDVy0Qmejc3cBmGPtwElpRhF0ZlA7+dUp8JEORRY57huwH
         ZEfNw9JTm8ZGi6fvqMbtJoLrGPsK8xW2IQSOscDoRn8mOvH+bcjPaKoDTC3PCd8l3xtH
         HpYriJVlf4vxW/Yp8MulivjAsf03WNgpViQNSBB5aYcjWK536hRICxTEQLMCl8w13bgN
         Rw7K9ZEqZM86cV0wBaxlvpLM6ZuawwlnN3RWkQnU7xjsGiYKZlJwCl8l061+4RZOiCS5
         opgA==
X-Gm-Message-State: AOJu0YxlcL1XxpjJ7Vz2gByQb3XHx7GrWguUvHrMlD3lUJ5eCxudCd3+
        HqkjZoC5jJi9oe2ZPIjQdW/Le6C0bcYNJRn7SljtjOYpYhxlAgRedm4=
X-Google-Smtp-Source: AGHT+IEPipIzYVr6c5bqd3U9lGiu/8QsUhJ/RGGR6I9AZPU9BGXYV1D3iDLGpvBOICBUrdq7ecDq6SO2NHQhB246Nyo=
X-Received: by 2002:a5d:4010:0:b0:32d:b906:40a7 with SMTP id
 n16-20020a5d4010000000b0032db90640a7mr13387wrp.1.1697657245588; Wed, 18 Oct
 2023 12:27:25 -0700 (PDT)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 18 Oct 2023 13:27:14 -0600
Message-ID: <CANLsYkzcdLOvVi+ti+WFZGtGf6TFf8D=oE8YpevCHJscMhHLtw@mail.gmail.com>
Subject: Remoteproc/RPMSG patchset review order for October 18th 2023
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[PATCH v4 0/2] Rpmsg support for i.MX DSP with resource table
[RESEND PATCH v3 0/2] remoteproc: get rproc devices for clusters
