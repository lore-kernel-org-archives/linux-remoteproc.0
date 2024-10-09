Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E301E47A1
	for <linux-remoteproc@vger.kernel.org>; Wed,  9 Oct 2024 15:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728489249; cv=none; b=RRZmWMh8m1qWLnqaQDN2JXESDxRB+d/dlxHAWwzvB+V+OmwbS/Ro/XezilNpwYJWFgo6OLgpEEhlfbwy7HG2RoBF4+l1fX7N2nb5RRcLmgeodFg3OtiaXx5K63tJu+6DyIdWRC/BQ4puLwGxUtCNfNMWdtv1APxBHDcSSVJbUi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728489249; c=relaxed/simple;
	bh=nAM+4uu5vTk/n0aQoY+yccvVJFEsYtw4m6pnwbNQZ6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCgwo3shSKQhXnOU88hpKtfYe0z9t0c/WbFtr0VwV9BcrvOgzYMCOhAiPSzAXjla/UHiY5kJxydc8hAoHqqs0tyQJl82356pqmw+ahZkT2jtBSHLEDL1aY1BzA4TSEtEbO5Y4XRBVnf1ZUl7btV++A1x1t4XUwfOruRrWltx+lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rk5FiHJU; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rk5FiHJU"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71dfc78d6ddso3710460b3a.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 09 Oct 2024 08:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728489247; x=1729094047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8761W3rypRmL3MeMAwrQjF2myH6re3LLMLmokDBjKNE=;
        b=rk5FiHJUBIrjZt8vtMjsvKHnXu3MjqXbPtQM2cWOU2mFuEH/+TgCBvuaMLyId2+4lG
         fu9hYXEELI/8CKGSf0p1PM3BzpMiklpaMEdfoPbNd/Mka+9USBK4GSM8DpZq0WhPMQAW
         FDsThPGs89+gAEGIbuOFbb9wtAPHiDxEK2ItwTlcirLhjVgtuCNzsIYonuHfmt9b1TO0
         D5F1i/1J+5KVM6JP7dVW7Z+dngbRt0QB8v+0E+C33F2wbRUjSoiml88XlJGq5Jy++KD+
         7dRwaNifCBHk/n0AvMgYkctQQhKkHkhY+yGS1Fhbw4kJ3pHB1Pul4jOSBMJwDmnOI2HM
         Zs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728489247; x=1729094047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8761W3rypRmL3MeMAwrQjF2myH6re3LLMLmokDBjKNE=;
        b=pwILZcdKvvPkjoiR33+9alyZ1K9lLU64TWP6ZGmC1pzo3NYKxkNLN3hCoPXtMjbDXK
         tXtfkNaOjs0n2Gs9bVhrOwPSVnLyCZut/Nn+yuxl3PDNApMpOXPB1oR2ln8RhQH+zrZ/
         zPLS28O5BB2xG3iiNSMLzafb8TZ56o1dHuvS4XaKcLyORYB5ppT9THnjy8OU7QOAW5uT
         FCQp6zcvGwuxrKufpzxaNJXSv4TBlgvFlgOyZ59BeBj8HiElUo5jHTHI4ettieI45YGK
         ieIGCW5S0N2lJwHBeY/gv/Z23w1wGxsyUXTpw2hn2fadCK8+b1NdlXtNDbDJh6LH739e
         MDmg==
X-Forwarded-Encrypted: i=1; AJvYcCVmiZQHFUqKqMG03M9+5YYcGrVe5FKGwWYu21bwfUWuMQkLuDcgizO93ejkPJQ3QpjJfCzzMW4SCOwdNYaTHg0U@vger.kernel.org
X-Gm-Message-State: AOJu0YxF7tnT7HBIpa5Adkh8WdHOqMg91knoTrNjEWQRZ2iSzsa6RrFe
	Cp64Y3+o+mkskNck5VXLfkQZ/Ofy5h+1bEB/cK38sSVirWyDf460IHXTPDmVBqg=
X-Google-Smtp-Source: AGHT+IFMB+sZkdSpCaDZJCQnj0/IIDGEUWaGrMrzjkcsrtXMG2WQxkgjdmH5TLlo58ss1F9KU+Jlkg==
X-Received: by 2002:a05:6a00:b52:b0:71d:f2e3:a87a with SMTP id d2e1a72fcca58-71e1db6ee22mr4867827b3a.3.1728489247092;
        Wed, 09 Oct 2024 08:54:07 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1199:5ae1:92cd:b017])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccf02asm7898411b3a.74.2024.10.09.08.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 08:54:04 -0700 (PDT)
Date: Wed, 9 Oct 2024 09:54:02 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: andersson@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: Fix spelling error in remoteproc.rst
Message-ID: <ZwanGrWs3PI4X7OZ@p14s>
References: <20241008071559.18523-1-everestkc@everestkc.com.np>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008071559.18523-1-everestkc@everestkc.com.np>

Good morning,

This is a case of old english vs. new english.  Using "implementors" is still
correct.  Moreover, there are 33 instances of the word "implementor" in the
kernel tree.  Unless there is an effor to change all occurences I will not move
forward with this patch.

Thanks,
Mathieu

On Tue, Oct 08, 2024 at 01:15:57AM -0600, Everest K.C. wrote:
> Following spelling error reported by codespell
> was fixed:
> 	implementors ==> implementers
> 
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---
>  Documentation/staging/remoteproc.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
> index 348ee7e508ac..5c226fa076d6 100644
> --- a/Documentation/staging/remoteproc.rst
> +++ b/Documentation/staging/remoteproc.rst
> @@ -104,7 +104,7 @@ Typical usage
>  	rproc_shutdown(my_rproc);
>    }
>  
> -API for implementors
> +API for implementers
>  ====================
>  
>  ::
> -- 
> 2.43.0
> 
