Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FABC433FE
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Nov 2022 18:07:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiK3SHl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Nov 2022 13:07:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbiK3SHi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Nov 2022 13:07:38 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1C254774
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Nov 2022 10:07:36 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id g7so8484673ile.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Nov 2022 10:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xO0gSON01n3HaLRnEht0nhVsfh7glZ+wunVwf9I8XYo=;
        b=NQQpHJ0rjjkKszWewCZOcMWnU0vqvOjDjnXu83q+MDC/wSHLTkmX4brKsQZSZcn0DI
         0GNAaEke0tOJi3x93GviMmwhg8/JfPekVaef1baUUImlPbvYvLzgkQ551pBgwYnrfy9L
         gQxvEmK1ecN/rKL02wEhVq6aMI/FpMRReIB/nBNDwXSGtyyC2WZ/6FfUxRSvJIS3es9+
         rZol1vAWgfxNumraLwBNB3FbmjHD/KoKnq6DjpchaHuhWx853DJzaHWMhNm1ZKpDGqH7
         OTl7QeWbKcQ8iBo4jtiGWuogWfBMg+MXiJeuyAnQ9dzkwN8NVDCBamYZoFjZRf0WysG2
         vB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xO0gSON01n3HaLRnEht0nhVsfh7glZ+wunVwf9I8XYo=;
        b=kQQSdKthDsUhRriK7Np3dw4YoEM0CELxtJ6spsMAN8nTMYtwIQDeEQS4LHHOv7cG1h
         nLWk90t7EpMJqdZBIcXIxlUdamxv8dIiW8zCVJlL7q8DK6D3c9fzQ05OXjwDL/tcfXWw
         ylTdRoNMITmqprbtL7kz3AzC8MVqBkGMwJaCZJkV0Gxm56IXqT/hHwfGlBK0PPZ4Kwz4
         7ZQMVT9qP9YChTRJEryubMLIjzjIHrHAHUqhGJSUztTnRjvCOXL7pweD8MbTQv95bYli
         bNQ5shi/Nbx3dRVuNBaaOZHjy4PGv1FBC1dnBNiEHLhWff9y1FnYfNoumImHtlSHRSJ3
         I/gQ==
X-Gm-Message-State: ANoB5pmoE9W8qIW/Xj09e16kRnUIZGUEJ/hytYOHXl6eVlSvhV3DLcyb
        wo26S6xFDHQHDqNC/j7TClJvxI+Ofl3nV+3S1wXS13WHONI=
X-Google-Smtp-Source: AA0mqf6gTTfIV8tytqJwxMTN9lx9oSuyXPOS4W7Q5tvz9l61U4O1/VuQQ32LPMSjqpsuyMra1uner1MlAn7sq52xiRY=
X-Received: by 2002:a05:6e02:1189:b0:302:fa94:c735 with SMTP id
 y9-20020a056e02118900b00302fa94c735mr12993900ili.57.1669831654803; Wed, 30
 Nov 2022 10:07:34 -0800 (PST)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 30 Nov 2022 11:07:23 -0700
Message-ID: <CANLsYkxdxiy8fCpq4uBSW1boU_Zvxz5ZOfy3WR8VsbyCMyZ=Ew@mail.gmail.com>
Subject: [INFO] Remoteproc/RPMSG patchset review order for November 30th 2022
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

My queue is currently empty - get back to me if you think I missed something.
