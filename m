Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2301D1757
	for <linux-remoteproc@vger.kernel.org>; Mon,  7 Oct 2024 13:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728307006; cv=none; b=dOINSnXNUu/ltl3i9Ugf5/aWZTPrtyaEy2zYV2Z9NX/Y/3cQDHJF/s8dw9LDKkYXczP4yyJ5xrGx2at0TdbnuWkcxeI5R3VLpghZOViW5m235Ytwbr9KohIir9SZY1OnLth9FZiMpk+/oS2xi0fC8lcGqyxTP7aAXXYF8eodD/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728307006; c=relaxed/simple;
	bh=c5zDZczpwoMhRCZTtD9TIprKTL2qFUSJSp44forXD64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlJl518w4GkFz1ev07itibWpaVKNRnvWnA6A8dNzu9CwhOJrg5c969IPAJgOfWbio34gAoPgceBu7E3dyBXkUlz89cZjZcvE/9KiC6OfoOHMmBE4UU94YYJVHGey7zfEid91XZSnLEg70twtbwm6sZnTWusJwnf+EdRbbEnysmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XsYWyrPL; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XsYWyrPL"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fac60ab585so45530711fa.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 07 Oct 2024 06:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728307003; x=1728911803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dCkBQA8INoWSpGqbgwA5jt6QuY5LVXtR8ZQ0xgygGF0=;
        b=XsYWyrPLB/p0aPFooLUEtc502zzKNuzHHLlWwRFYySERoH9B4VacYJFPm2CPi11PYz
         RAowKOf7d+pQ76NorSvFjMj1qt0BCLntyFWfJWHJKPrEzxax9vSFkFTNlRiCbX9RoXKn
         emTPYtd6bYsFNb+XpBv7koqh+Y0sa4aqmZrVkT+4zggJJ2YHXXsgf7vUHHoYnRphh5A6
         rLzgASx0PEBsLk8JRdSCFxNfGKirBp+CObYCMQWSwPYddvGMpmEdgEi+kQoNDyZqwXca
         5fg7iKCJW9lkY5F3SJr2au21W7HtVU+kUAnzcgUbC+u3EcbA3zHwLn0mBUHZAHugAsXe
         XG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728307003; x=1728911803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCkBQA8INoWSpGqbgwA5jt6QuY5LVXtR8ZQ0xgygGF0=;
        b=Uf2AqGtU68gV6gxheMIyHQC671CxscnVK8rg1sMaekdYZMntQsQpdK5FQPT5d34nTo
         4tjssk1wKyVW35ZEafS0/+gyLLEO13zjPwBRTofvujzc84/2kUhxjoeLTnP9YacvJcru
         NYE7HS6p/bRvD/NtJJ2X7uDV+zprinFlI7y1u9amUs8ukfGuqr+3WKaUDS7u+9jRWhPG
         rG3/pGPMgO7xFCgIf36xEycujrTtJxRR7j9qJdGJN3coB/V0L5ubQcbJhoV5Xq6xZHBd
         krAmy9s0o69T8EkWEBaVb5dZqe/xOZRVYJQz7sGDPM741MxInV6SOyqLvp+UwyxM4jKn
         ArmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc35KPvue6AH3FCmK6udCMv7W8a0wUrcT2BXKWnKPpwYB+vzSSefbmzJ26WYQan7VsNXZzfWL1LqBwT5g4eKXM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1JnhoL0hAZk/7KFOgQpKN/7vPsyNwV+1GrLABX5PG3bEjJSrH
	sahOcTfsmxyDr2kbgzM4yERZooO86mEoCGdCfEN+LJPdBGUsghj5OFc9vZaBC4I=
X-Google-Smtp-Source: AGHT+IGZ1mDDEjhcmG+T6pvJMY5EAIlF8UJwKfOkVTjp4MAKBG18DAhtjPcfQoU7T5moxF77LIIMQQ==
X-Received: by 2002:a05:651c:556:b0:2fa:d58d:dcf3 with SMTP id 38308e7fff4ca-2faf3d9d58emr49272581fa.33.1728307002704;
        Mon, 07 Oct 2024 06:16:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9b24867sm8453081fa.73.2024.10.07.06.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 06:16:41 -0700 (PDT)
Date: Mon, 7 Oct 2024 16:16:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
	Arun Kumar Neelakantam <quic_aneela@quicinc.com>, 
	"open list:REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rpmsg: glink: use only lower 16-bits of param2 for
 CMD_OPEN name length
Message-ID: <rmybaobbmhmynz3or4uwvhdgqjrkahmkwz5ncct6rssnfpq4jh@ulqeqesixyhz>
References: <20241007044723.25347-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007044723.25347-1-jonathan@marek.ca>

On Mon, Oct 07, 2024 at 12:47:22AM GMT, Jonathan Marek wrote:
> The name len field of the CMD_OPEN packet is only 16-bits and the upper
> 16-bits of "param2" are a different field, which can be nonzero in certain
> situations, and CMD_OPEN packets can be unexpectedly dropped because of
> this.

Any idea about the upper 16 bits? Should we care about that data too?

> 
> Fix this by masking out the upper 16 bits of param2.
> 
> (the commit in this Fixes tag is not where the original code was introduced
> but it should be far back enough not to matter)

Let's be more precise:

Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")

> 
> Fixes: 835764ddd9af ("rpmsg: glink: Move the common glink protocol implementation to glink_native.c")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 0b2f290069080..e4933b823238c 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1204,7 +1204,7 @@ void qcom_glink_native_rx(struct qcom_glink *glink)
>  			ret = qcom_glink_rx_open_ack(glink, param1);
>  			break;
>  		case GLINK_CMD_OPEN:
> -			ret = qcom_glink_rx_defer(glink, param2);
> +			ret = qcom_glink_rx_defer(glink, param2 & 0xffff);
>  			break;
>  		case GLINK_CMD_TX_DATA:
>  		case GLINK_CMD_TX_DATA_CONT:
> -- 
> 2.45.1
> 

-- 
With best wishes
Dmitry
