Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09878C433FE
	for <linux-remoteproc@archiver.kernel.org>; Sun,  5 Dec 2021 06:57:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbhLEHAs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 5 Dec 2021 02:00:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231966AbhLEHAr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 5 Dec 2021 02:00:47 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07FE8C061751
        for <linux-remoteproc@vger.kernel.org>; Sat,  4 Dec 2021 22:57:21 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id x15so29756370edv.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 04 Dec 2021 22:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wizery-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ihtUddHm1mmpZX6mKILinJnPqhvWBjnk1DVyRj7DW/k=;
        b=ivYPueHJXr8G/tixCqpOnNNjr6hVYWpjVVhdx5eRQkBzn9DEf3V2WXDE/Ot9qCYjJM
         +rGTZbBiIZz88jpKYaj4R5wvKsq4ARmcBObObFUS4Rcpx4aAT49bHqxGHCMeJgw1FZX3
         rcDuxGEpp2FDmNkoARANvAb45kSP9TdK1j9e2dUXiXol2s3bCBaU291FQ49CruB3Esim
         4PbHtWjz8PP9koYc2wpGpPx+q/pPXaT46IeoGidLEnTTTwRWDf00vHlA0HBcXonHc4Wx
         w508nPLvO+Uk/CruDcGRus7ffM3+RzStu6IEW6BL8Ff9TZzeeavl5cJvMeNNBaY1wu3c
         Ofhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ihtUddHm1mmpZX6mKILinJnPqhvWBjnk1DVyRj7DW/k=;
        b=fOHZ9qifgJ2N95uLjK3MXIUtSAEba33rQVXXbaimhsj3/64CAEWttA0qJRG4LETH7Q
         wBLAqZ6q7QrBw0TyXp5opjH+GXwV2CZHVAN1Lk9sDTF9HJd2+899qUqMTgr1O8bhgZ3E
         Iz0kbWL92uKjb+napTOOjlIJ/j/zmf5qwhqubHDYq2sKcj1+00VbVEqjpswa1y1UjV0E
         pwI/N5Dn/DiQqItPpub9oK4oICV9W7xfYCMuo8KmlMNRh9nDKS4wQO0VsWbU0OY79H9F
         QB/3sgNG9Ypx9nJJep+jZH8u3I6G5naDDuMpU1w4oN9wa4JwcDOHCpcc9r6H6KOJtQNQ
         b+nA==
X-Gm-Message-State: AOAM531AUqZzmOfkLnhdIS/ogck4WhynHtEq2XGg5sLYWLQlepckGH5g
        L4I4NDpwIvhmA4FbwW+4jT63OOcNZUDx7GskzS80QQ==
X-Google-Smtp-Source: ABdhPJwlQVns3tde9ZhEG7WZB+IfUFwKFTGrch9aORXkrQvhDNwdkOc7OhOOmstiIZC8N/g8H9LARkPCDOsDRJvNV+Q=
X-Received: by 2002:a17:906:55d7:: with SMTP id z23mr36204767ejp.393.1638687439448;
 Sat, 04 Dec 2021 22:57:19 -0800 (PST)
MIME-Version: 1.0
References: <20211202171125.903608-1-mathieu.poirier@linaro.org>
In-Reply-To: <20211202171125.903608-1-mathieu.poirier@linaro.org>
From:   Ohad Ben Cohen <ohad@wizery.com>
Date:   Sun, 5 Dec 2021 08:57:08 +0200
Message-ID: <CAK=WgbYTfrBfW_8R5Xbfd9e2DkqnfWAOTRv-DmjfADXsxqOqyA@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Removing Ohad from remoteproc/rpmsg maintenance
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Mathieu hi,

Thanks for the patch.

On Thu, Dec 2, 2021 at 7:11 PM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
> +N: Ohad Ben Cohen
> +E: ohad@wizery.com
> +D: Remote Processor (remoteproc) subsystem
> +D: Remote Processor Messaging (rpmsg) subsystem
...
>  REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM
> -M:     Ohad Ben-Cohen <ohad@wizery.com>
...
>  REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM
> -M:     Ohad Ben-Cohen <ohad@wizery.com>

Acked-by: Ohad Ben Cohen <ohad@wizery.com>
