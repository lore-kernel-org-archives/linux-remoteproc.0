Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4922609FC
	for <linux-remoteproc@vger.kernel.org>; Wed, 30 Apr 2025 15:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746025202; cv=none; b=IBfsHWGiZ963zYUydaoiJxF1vRK9ESO9TCEAAk83G2Tm5f4t/EC1TYSHy54T5WuzZvhzSfCTEK5Y3Sp5OVHhUfwmV2QeyydkSy5INjoQwd0AnqKofAdptT4qi+BIhlQlqCjHDzgZqPFosJ5OxaJ8yolMg9jpj9x7j+tEApbE6Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746025202; c=relaxed/simple;
	bh=rcWl+QmYf007ChLfgmF/lkXGahRIqtD3l2zvf4hd2JU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDPo9Vk0kot1DiPgB15Lcp0TGd8smrV7vXeop801cLhDsvQAmeD9wL9kOw3IrU5I6zBi6CIveHP7ROxDl36Q/SIA4mpbh2RLt7vt6xGVL6jF3aNUAyaS1EFo7LpdCR5RKn6Ntzc26LYOtWAMrAQIAVF0X91EqRMW7tjCG+q8Viw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OtFp+EoT; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OtFp+EoT"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so2082577a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Apr 2025 08:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746025199; x=1746629999; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s/GOiooi2lf2dyrYlf9XubY7rFtvSk864Rz3PS2UrNA=;
        b=OtFp+EoTW0CCcauVbYQV/EHRhph2Z7RWjC6gbB8hjYTphL6xy3Mg2tonCGUj9Anj1W
         pt4HGju1ntUichM7CWD08IbPAw/K0VkW5nC3pKNB5sRo9mQwMTJ0eGj/icIpG86TQq1e
         P+g0DAgM3qakkfHyJjbOeNuXQWjIlu+QVH/N0MTDzsmh2ojhgRdylbk/Mk2NKVOGO3Eb
         y4RMQilc4kppSuaMrYYGADu65XIlwVRkFp89h92eTN9uMMcJt2UvF55mJIEyfV+HyhbH
         gmlF+3raqr7bm0kTfn334kj+f8D7d05wOI7Pd5768Uf2Gpu852tymQCne9GdUYpRKi6+
         Yvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025199; x=1746629999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/GOiooi2lf2dyrYlf9XubY7rFtvSk864Rz3PS2UrNA=;
        b=dvyp57DfEONULP9fVdwndNoaA7yMEl1XN7G7GnByv8YhQH8jmdP+hAf+a0QUMc8fNL
         BzgKQTgs+lFhg37HeViMTYpd8/VBEW2Jp2ZS0Mx8248sN53rqmnyiYQm+hHZz5FoSKYA
         1SN12rCa0TBwpob/b4LF99lkIa3Ded2hPxffqIVaLnqj61dLgmj2OHzRz+I5UdF8lGyW
         HEpCbKSTcm6UWfBeHsqt15micNXJ3W1r0qv/h5i/o0t94mQ8YdoLyVovobWY8FU/SuXw
         onO7ZzE8F/ayBLlB2eY6dsnsYzlrCqf8I/u2eqb1bj5rRd+kk/4lLxhprHe/IU1XPum0
         4Hog==
X-Forwarded-Encrypted: i=1; AJvYcCUwGFGqpqID+7S7CMO5AseLOHEwHc+tE5JK+HLxL6CR9EgFfJvjq7AMu4jagta7HVIqU5eIYrQ/PGMgGBcQFnEg@vger.kernel.org
X-Gm-Message-State: AOJu0YyHlJHFuCXPoi6EzSa1lczGKND+E4n9vc2pM3Y62YMi2XxXVqZn
	9nVZrIq4FapLimAn1S/T4t8dVuhKzUKQugthP37DW3Dhc7/NeN4WmWpBHrl0wTAaUjWNJ/PvP8g
	5UZ+M3MK4v7o5ELjPTM88wOuefKx/3yaQZ7KP4A==
X-Gm-Gg: ASbGncvxknn6MYiwfxbqisJ8APcpR7vRLUJ84nFrAk4fzP+p6OoRBo0TlQjXWC7GBGc
	8RSiLDVAlbAapJ1HYe77bThRboSnY4CqVCJxuR3yw3dZM3FAayBAKctQW66m54BhE+qbFbkhqIY
	i5m0CThChft3e22UdWWw3rPEVfgJDlZF0AE2XBDUAaK0PKKBswfJpIRQ/m
X-Google-Smtp-Source: AGHT+IEuPe3FvOa41k60hnkwtbcvwue35KXfaVRFILnxHi2Xr6Nw0g2Wl1TPRvOhPCaTVHuhJu3g6QUGmtnCWiSixUk=
X-Received: by 2002:a17:906:6a07:b0:ace:bee8:ae0f with SMTP id
 a640c23a62f3a-acedf65b2f8mr255011966b.1.1746025198691; Wed, 30 Apr 2025
 07:59:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429104543.66927-2-thorsten.blum@linux.dev>
In-Reply-To: <20250429104543.66927-2-thorsten.blum@linux.dev>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 30 Apr 2025 08:59:46 -0600
X-Gm-Features: ATxdqUHj7Y9iIyVfGpSZ6xZiHXxko6yaKFvQ3VxEGVgKRHWDbymrU0RIpwfEGLI
Message-ID: <CANLsYkxBxt-fE-kV3yS7WDQuF4o7OSL045fMmXrTvfx3P=A+1A@mail.gmail.com>
Subject: Re: [RESEND PATCH] rpmsg: Use strscpy() instead of strscpy_pad()
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 04:46, Thorsten Blum <thorsten.blum@linux.dev> wrote:
>
> kzalloc() already zero-initializes the destination buffer, making
> strscpy() sufficient for safely copying the name. The additional NUL-
> padding performed by strscpy_pad() is unnecessary.
>
> The size parameter is optional, and strscpy() automatically determines
> the size of the destination buffer using sizeof() when the argument is
> omitted. RPMSG_NAME_SIZE is equal to sizeof(rpdev->id.name) and can be
> removed - remove it.
>
> No functional changes intended.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 2 +-
>  drivers/rpmsg/qcom_smd.c          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)


I will let Bjorn take care of this one.

Thanks,
Mathieu

>
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index a2f9d85c7156..820a6ca5b1d7 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1663,7 +1663,7 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
>                 }
>
>                 rpdev->ept = &channel->ept;
> -               strscpy_pad(rpdev->id.name, name, RPMSG_NAME_SIZE);
> +               strscpy(rpdev->id.name, name);
>                 rpdev->src = RPMSG_ADDR_ANY;
>                 rpdev->dst = RPMSG_ADDR_ANY;
>                 rpdev->ops = &glink_device_ops;
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 40d386809d6b..3c86c5553de6 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1089,7 +1089,7 @@ static int qcom_smd_create_device(struct qcom_smd_channel *channel)
>
>         /* Assign public information to the rpmsg_device */
>         rpdev = &qsdev->rpdev;
> -       strscpy_pad(rpdev->id.name, channel->name, RPMSG_NAME_SIZE);
> +       strscpy(rpdev->id.name, channel->name);
>         rpdev->src = RPMSG_ADDR_ANY;
>         rpdev->dst = RPMSG_ADDR_ANY;
>
> --
> 2.49.0
>
