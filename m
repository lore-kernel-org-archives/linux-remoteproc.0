Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5E11799D
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 May 2024 16:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716310427; cv=none; b=lpxe8FRIOTOp171fxci1uJLnq/Dp4Mb2UsbDH6TlXYol1BflPjM4iMI5IOVDzKlqEzXLSCbeweul4g8pkKDQafW9dEP7IZE4Hj2mAwixpqI4o3acnC3tbn/2UeE+gw2UnG+0rTEf/GGevazHYMUsjADJa24pjc5KcwGhvav7UEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716310427; c=relaxed/simple;
	bh=XmDn6eN0uzf15c6j3/qpL6cU4Y/ehn314rlUK05MXGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqNr/EmoQfQnISTw/vCRx/1kbAaCaNXWe8mMe5BNUXIyr/E/Wdzrj7eIhGmK1TyfdqDWIbrtVDsWsnJm59+981sU/6o6Gs8kb4V4uIXZY+cEsQ9ovCnirhyd1hz/mnknFZkF/GA/9h+mOkMK8R7eBOQ6bYcIac5tQccoCzvuUns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lv/bR4xK; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lv/bR4xK"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6f453d2c5a1so1701856b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 May 2024 09:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716310425; x=1716915225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1mM1g0xrjA2+TMpOMuz+nMei8rdJzFNTaJUyTE9ff1o=;
        b=lv/bR4xKd0F/fSIjQI9jztJob1jRijjPHTQNQ+J8uzpy9FlAaumUhV0YxSkk21MbiN
         jXqbZk+RzrX3w3tIZi+hHgwskvqHmJQs47XUhNRCeb3XlyFHjFk87S8SWkN1rmnZlNhd
         ZJiaCDPzKERpGHbLxGgIH60UtmV1LkAGKyFGlUWLjjtpCELp0kwHDpD3Wj7/tc9BTKi4
         AMde0/GpUZEa7lA4HlRHpCFAZuIzhqaETXACvrtcRNVttdcayC1kmFAO9pekAl4XMT1i
         k47KOzAQcwpFUoqssIYXSq76mCzWYZ68uhA3iQi864BdaMJ+NQXtPoSw9ADzwr2crCus
         Nlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716310425; x=1716915225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mM1g0xrjA2+TMpOMuz+nMei8rdJzFNTaJUyTE9ff1o=;
        b=o2q8h9s3Pp7PZUts6ELaOIT2X8z+O/FMBeHFURdoRLxnbnEulsgV0Ny/dQ4Uo7CjGD
         30f3vDeVqHptCYjf1ZYPGpLuzCJnAWr08uSMw0aucr+trylf3FXQeqfb98Uqe4hZ0E3O
         sca34pNPtjvijr/eae7DGXj0+0Me6gPN8AaZU8TZ5i3425+45rtTJVwwLyNgpVddSFX3
         KVGaSRsruBhpIbriGlzSYHp9MhEuJAQBdOvvDWLkNSfpgSXi3xO03ET+X8+e70/kRDLe
         AfEgUo+314+VupDoTDntUNF0T91K+kb6bdJpqyTs2QRoXMh5BilAeaLTdnKFteE3JB5g
         U3cw==
X-Forwarded-Encrypted: i=1; AJvYcCWIzZtgwcyojCS6EA71UaZnM0Doswg1ruon45eg279ngG0EIEmHmGJWLfusVnqZSuRqe9EOQp6NX37WNBbx5EbdJ/BmlES/b69/qchhvkyMZw==
X-Gm-Message-State: AOJu0YxvYRQJV+OAZkYwYyjBYebt8lvkIOjr2MJPgQuR2yyOTiA+ic/b
	riwtBEF+qJMaQSOpSFotrGwcs3BcPKuqrka0Tlrmm5c9TfUrsTv4VsOirS7L/rBhIlKYxG/DA5Z
	l
X-Google-Smtp-Source: AGHT+IHhV0gEhBAlCrDzmhUFkEADtc9n6dtJk4+JERFEyQ+wIpi754KQsmFo/JDNnXvh6Bc3efJ+Pg==
X-Received: by 2002:a05:6a00:10c9:b0:6f3:f447:5861 with SMTP id d2e1a72fcca58-6f4e026b8f2mr33863693b3a.5.1716310425549;
        Tue, 21 May 2024 09:53:45 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:df1a:22de:40b2:f110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-634103f80absm21017394a12.65.2024.05.21.09.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 09:53:45 -0700 (PDT)
Date: Tue, 21 May 2024 10:53:42 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] rpmsg: char: fix rpmsg_eptdev structure documentation
Message-ID: <ZkzRljZlpCFDOyBx@p14s>
References: <20240517165654.427746-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517165654.427746-1-arnaud.pouliquen@foss.st.com>

On Fri, May 17, 2024 at 06:56:54PM +0200, Arnaud Pouliquen wrote:
> Add missing @ tags for some rpmsg_eptdev structure parameters.
> 
> This fixes warning messages on build:
> drivers/rpmsg/rpmsg_char.c:75: warning: Function parameter or struct member 'remote_flow_restricted' not described in 'rpmsg_eptdev'
> drivers/rpmsg/rpmsg_char.c:75: warning: Function parameter or struct member 'remote_flow_updated' not described in 'rpmsg_eptdev'
> 
> Fixes: 5550201c0fe2 ("rpmsg: char: Add RPMSG GET/SET FLOWCONTROL IOCTL support")
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 1cb8d7474428..98d95ce5b6fb 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -52,8 +52,8 @@ static DEFINE_IDA(rpmsg_minor_ida);
>   * @readq:	wait object for incoming queue
>   * @default_ept: set to channel default endpoint if the default endpoint should be re-used
>   *              on device open to prevent endpoint address update.
> - * remote_flow_restricted: to indicate if the remote has requested for flow to be limited
> - * remote_flow_updated: to indicate if the flow control has been requested
> + * @remote_flow_restricted: to indicate if the remote has requested for flow to be limited
> + * @remote_flow_updated: to indicate if the flow control has been requested

I will apply this patch next week when rc1 comes out.

Thanks,
Mathieu

>   */
>  struct rpmsg_eptdev {
>  	struct device dev;
> -- 
> 2.25.1
> 
