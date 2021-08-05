Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F45C432BE
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 18:28:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA35F61159
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 18:28:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241308AbhHES2m (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Aug 2021 14:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240784AbhHES2f (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Aug 2021 14:28:35 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18021C0613D5
        for <linux-remoteproc@vger.kernel.org>; Thu,  5 Aug 2021 11:28:20 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id v24-20020a0568300918b02904f3d10c9742so2737718ott.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Aug 2021 11:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=ZRC0I+Fj57vTGFwWYvogXG/k+4kQPnUbqniQWnYcZfg=;
        b=l67J4s2FdbEQUdpUjbdwxT5ZWXBo7coElkyvPRot8BzRGsD7OfluQhMQXvWMN8wera
         HTFLYJfJ4dTstUbMW8RULuPXW0gNkJXbVeoM+2yuMI1ZnIpgwyBaJjyO+nowGugZ90OA
         E0Mr0nSqRSn4Glsgud+j3MH9hsV0zVRO7E2W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=ZRC0I+Fj57vTGFwWYvogXG/k+4kQPnUbqniQWnYcZfg=;
        b=rArJiHt6O/HruTx3fm93MqWW2hXpAwQktJkPbEOv7qk6V5vrYfR5cJlb7WdyeFXdBW
         BTmAhpRo7sobOUATP54rloBD1v7sbLjCcYT3De178YTX9hZND0jv033uqt7XU/byFH0j
         9yDjAwgo7MQ+hNqbmn0FmTs7XuMOlUrsUUSjJxuyvhAeHeLU33AkaoA0VzQdYbV6YGOZ
         RoX2a7xtDjPq0ueKlTJRSn5qs0RR6R51kQlGwQCpWgTCczvUDqX8j43uleRVfQRHAZLx
         LhZEEDD6HduzuGEyVrmbLR5mj9rrIZp5tMB/tFbcil3JyW0WEt/mw8MZsvnzvcBPvsGZ
         +svg==
X-Gm-Message-State: AOAM530ZBdo8Zo7KBq5BOdB6/0GggmAV5MNYoDOC6R+1MHnmZT1cTxPE
        ssMH2aSr+/nq4LeFQPan+tE+byQFWb1vImXc6w41Yw==
X-Google-Smtp-Source: ABdhPJxZ7zEQf3N1JXL0AeBYTCc21Hm0ef4XDvHY6j/YfT9L0BSzQ9VCUhwtGjkQCHc/t3d3W6Iz5b6rbfe9RR3O1so=
X-Received: by 2002:a9d:1b6e:: with SMTP id l101mr4676043otl.34.1628188099488;
 Thu, 05 Aug 2021 11:28:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 Aug 2021 11:28:19 -0700
MIME-Version: 1.0
In-Reply-To: <1628161974-7182-3-git-send-email-deesin@codeaurora.org>
References: <1628161974-7182-1-git-send-email-deesin@codeaurora.org> <1628161974-7182-3-git-send-email-deesin@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 5 Aug 2021 11:28:19 -0700
Message-ID: <CAE-0n50CM=DpXx7fzrcnWox+ZSfqvWuEb-R_rTP8ghR+bd54eA@mail.gmail.com>
Subject: Re: [PATCH V5 2/2] soc: qcom: aoss: Add debugfs entry
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Deepak Kumar Singh (2021-08-05 04:12:54)
> It can be useful to control the different power states of various
> parts of hardware for device testing. Add a debugfs node for qmp so
> messages can be sent to aoss for debugging and testing purposes.

Is it ever useful after device testing? I'd prefer we not apply this
patch as it looks like testing code that won't ever be used after
developing this driver.
