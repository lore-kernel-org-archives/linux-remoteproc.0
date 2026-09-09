Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55614569F04
	for <linux-remoteproc@vger.kernel.org>; Wed,  9 Sep 2026 15:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968498; cv=pass; b=HDeRci4XnkJWsiQYeBJHmuRkkE99S+nG+BkpPO6NWHnv3SDwMwH0JIuqBim4aamYcyAPNFn2yQWipw8cn6Ohnoa5OJXOrqvtW1fNS1tdjxxMAc5bLc+VYYjjCOvBjTG6urDzDznwSwAWDyIurPb+Sr71isYsVe4uj+wAcoVwJhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968498; c=relaxed/simple;
	bh=DA26JrnX3E4RsZIWoSih3Ec3dRXpu4nzTbYX02OsN68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M1ILvOC5+I5lYQF5H+FkrPsyFHt2GyBoN02WeAW7+eHJ3eWsdPJojf+ckt43gFEMN8euAOJhnbCAWRcHn0xirW/e4BuljYqqCS/o4V1uT7Mm8HfdidxVohEvS73eYWsoTrf7TKCK7PpDuZ1xXRBTD8ojVZ5rWYoixWDlxXgPKGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ch+N7G8j; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ch+N7G8j"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a9a20a5e72so342551a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 09 Sep 2026 08:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788968494; cv=none;
        d=google.com; s=arc-20260327;
        b=Of+S0jk/DvgzqE7FL9Sr6K1L7D0Y0lWKS17HQMxJVO+pcVutKRWYAx7K2N4fDgw1kx
         a2t5bLvdOvYCSkLyHKIx7rcTYip5nmvQM2KjQIDKdFXW3Nc1H2u7lwe7kO4nwbIMPMfC
         zjzO3uVAHnjr5RUWAqJKytwCIW8dpjQvqPrXEPwr6p0Kk/VeDcvKeEVy6C9dXmX1QxeG
         KD/ORH+VDj4q45Klv6ZunFZxzkMabSZwuW2oi79BDoQn6kBR0W/2JKSPjZ70jcLQjvxz
         RXWVbY05xZqRbiefQJEWr+qLHs9te9I1veueigUwzV/FYOPviQNsOXkDY8ZPvjpA7hPf
         bqfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OE746Q3CGcAa+cfSWox7gIp7vBDUlJHpBAlocTfV07Q=;
        fh=j2YJY/Uk5zRyuBCon0Ep0qtl43dYS5Whpt5q8XJBAIw=;
        b=EBntrOcJgbYbsTXUn9RTdob9c8/ijrTTonxfBnUN2FYr7IF9DytCvhHzVtb7Hi25JM
         SVSx1/+J31hckuUH8dqGLN4rAjf6szRep6YMBJ1vxpVxHnqJZUig2aU8a/76RptsjWP/
         mKe9m4GLj5mCmSrLazbKa+bRT/kMWt/tc1x9eYVLzcEzyQ4Q6LuvxFC+UnFEHcXWDxnK
         CmHJO3HsnSEiSW1ihyQUxyQCfMRzroLXhcQKxkPWvatbNb1O/AVFVfwvzPzUOA/ALl/x
         l8aMnydIxCRrfAuPsVBdj1Y+9ahipPDwIAIkkCYq927omAlzYXA+/0nru7GW3gS4Z6pB
         aGLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788968494; x=1789573294; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OE746Q3CGcAa+cfSWox7gIp7vBDUlJHpBAlocTfV07Q=;
        b=ch+N7G8jzN5Pyok572cOXew8dwRJn/VKCzarLoHV5wvb2ejWx3uJ8G/XcgO9eK6McW
         iL6fwE869SdreUR9A3g8Cw1tCf4xa0uznkH1p0l5J/QqMYJuGoGH2f6HmlAmbY/kVQmV
         L5w6BbcBKWTUTHJ/adXRdEsyz2taxDW3f28lGJN1b3kTRX/412kZAchT1rWK1GKtTh06
         fmZ7UkQYavLfZaSIQ1/OsOYaFktM+vAtq+ilwBPKXq2GmSh3dtD7nD7Ei5/b6OXf0W+U
         GeQ0K1Jf5YVX4M3OlGIDwm6/+b7ymV7cc0OYkzYwEPwISt1U+7jHCv+Gm/iClUei9Gbm
         QKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968494; x=1789573294;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OE746Q3CGcAa+cfSWox7gIp7vBDUlJHpBAlocTfV07Q=;
        b=lYqSSp0CkKLHYN45BVMhFqtPWcYL71D198pn432CFhj8nRM7JkzNQWiK/Rbm9h9Aec
         nxS8q+KVbEiLeo68qZx9kwiDfpDbyHjkwpqaL5O9RiqZcRiBnzQNcVTTtdFPbfHeFO0+
         HWZWpRcepa02s7r91Kcyb5qrgmcDo0Y99QwGkIOEgbakRK8LqcaFeLQbOhjAEACGT0Js
         lb/XA8xcsSUbfwFaWocHPTFbiJH2XArrMkNDl724O8Fkh/yZNijE2uDap9jAC+iiXZAa
         fdvvgAI7I195d06IMzhPhGgwrAiwqIPLEZdT0CMKd+sS8I8HUphKWu+eErk/0H1+nwcn
         Opng==
X-Forwarded-Encrypted: i=1; AKwUvBwTYfnOXin0v83vNM/foxPKLVGGTG3sjpRfFYafU8bCwhtTvtL0FhxcCNo7hmlwGvy/exQqVw9gGTeHThUHjJ57@vger.kernel.org
X-Gm-Message-State: AFuF++lLzsKXvjLoR5RaQUfRjX8G51xQVSaIpTN7x0hwmBkronfaaao4
	tmh9iqF0kvuo5M3/NAf+UPjfTAVhmQf1tCl5oox/Iiw9quBgDsGtX3YfawZfuQzB5XQ9TIYsZxh
	IGIf1+w71dz8tiQer6qoHDB+X+gNuxekAfEr6kzBYkQ==
X-Gm-Gg: AYBFou3OM8gdAa4iSUdNBT/QXODyGbPIA1cfmnTC+XoIIFKdjt/D2erPJFgluSCh+zq
	iPwcJeqVIGLnwp6TlmXnV4wQf5TpPjmA7HHMHNbVOx0xa7jma7ZF4Nq6AhHbcMF/TBOEOxM0C37
	KswwmQEwlBXhzNTcasOjSTQ6JkfTQy+z/G4QxIOWL2HmVnF65Mvxz4SDZ3WVMjOf/DHtjX9zc/l
	i+vH5zx5lMS6v1YG3NG71MJttH2sOyr5egRhr9ydOyhmIi+QXNGD/f/SyO2clu0/nkxxG5i5dYj
	8e9UNeT1LQ0uzSXdaDT6q+ZVkYwpkH7cYivqfQJbay8vux6aLHd/SgLT2U0KQxHw4JxlVL8fzYK
	wDEJ8/bEmH8zC
X-Received: by 2002:a05:6402:20db:b0:6a9:9766:59ad with SMTP id
 4fb4d7f45d1cf-6a997665c9dmr1429015a12.43.1788968494461; Wed, 09 Sep 2026
 08:41:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-samples-rpmsg-fix-mtu-print-v1-1-f995518f0a46@kernel.org>
In-Reply-To: <20260908-samples-rpmsg-fix-mtu-print-v1-1-f995518f0a46@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 9 Sep 2026 09:41:23 -0600
X-Gm-Features: AcwNN1VbOKjQ5djFohUS65OPwyBM-GC5UpqwPhHbfkhdGunWingdbYpulrxuNtM
Message-ID: <CANLsYkw6BmxHu5r0g=oLJqWCFrrU38vh2y-WVHHX14SwEf7uFw@mail.gmail.com>
Subject: Re: [PATCH] samples: rpmsg: Fix mtu printk specifiers
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Tanmay Shah <tanmay.shah@amd.com>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 16:10, Nathan Chancellor <nathan@kernel.org> wrote:
>
> When building rpmsg_client_sample.c for a 32-bit platform, such as
> during arm allmodconfig, there are a few warnings due to using an
> incorrect specifier for mtu:
>
>   samples/rpmsg/rpmsg_client_sample.c:68:59: error: format specifies type 'long' but the argument has type 'ssize_t' (aka 'int') [-Werror,-Wformat]
>      68 |                 dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %ld\n", mtu);
>         |                                                                 ~~~     ^~~
>         |                                                                 %zd
>   ...
>   samples/rpmsg/rpmsg_client_sample.c:72:50: error: format specifies type 'long' but the argument has type 'ssize_t' (aka 'int') [-Werror,-Wformat]
>      72 |         dev_info(&rpdev->dev, "rpmsg MTU size = %ld\n", mtu);
>         |                                                 ~~~     ^~~
>         |                                                 %zd
>   ...
>   samples/rpmsg/rpmsg_client_sample.c:79:17: error: format specifies type 'long' but the argument has type 'ssize_t' (aka 'int') [-Werror,-Wformat]
>      78 |                         "message size %zu exceeds rpmsg MTU size %ld\n",
>         |                                                                  ~~~
>         |                                                                  %zd
>      79 |                         strlen(MSG), mtu);
>         |                                      ^~~
>
> Use '%zd', the proper specifier for a 'ssize_t' variable, to clear up
> the warning. Additionally, modify the last dev_err() call in
> rpmsg_sample_probe() to reuse msg_len instead of calling strlen(MSG)
> again and use '%zd' throughout the string consistently.
>
> Fixes: 1029c89bafc7 ("samples: rpmsg: Add MTU size info")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  samples/rpmsg/rpmsg_client_sample.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>

Applied.

Thanks,
Mathieu

> diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/rpmsg_client_sample.c
> index 4c43436aadb6..8c629065c64c 100644
> --- a/samples/rpmsg/rpmsg_client_sample.c
> +++ b/samples/rpmsg/rpmsg_client_sample.c
> @@ -65,18 +65,18 @@ static int rpmsg_sample_probe(struct rpmsg_device *rpdev)
>
>         mtu = rpmsg_get_mtu(rpdev->ept);
>         if (mtu < 0) {
> -               dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %ld\n", mtu);
> +               dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %zd\n", mtu);
>                 return mtu;
>         }
>
> -       dev_info(&rpdev->dev, "rpmsg MTU size = %ld\n", mtu);
> +       dev_info(&rpdev->dev, "rpmsg MTU size = %zd\n", mtu);
>
>         msg_len = strlen(MSG);
>         /* make sure our message fits in a single rpmsg buffer */
>         if (msg_len > mtu) {
>                 dev_err(&rpdev->dev,
> -                       "message size %zu exceeds rpmsg MTU size %ld\n",
> -                       strlen(MSG), mtu);
> +                       "message size %zd exceeds rpmsg MTU size %zd\n",
> +                       msg_len, mtu);
>                 return -EMSGSIZE;
>         }
>
>
> ---
> base-commit: 70e14d5db3a01a44f6c3217bb3dda2dd5828a507
> change-id: 20260908-samples-rpmsg-fix-mtu-print-1903f03216ef
>
> Best regards,
> --
> Cheers,
> Nathan
>
