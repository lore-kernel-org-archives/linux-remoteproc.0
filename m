Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9C54BA80
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Feb 2024 21:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707167137; cv=none; b=XMhYxI1aNZVMK7DLPd/6hcsSH9JP70kkc/32xwPS7GAgZyG1f36tzExjARG1mgYslK+2vM3dMjmm18BELbpExHpE7kGrdJF0TPic1Df3YKhMIdo8elKF62DKtQ3C2iuviWfmZFppqqJtgW6WkAUO7CMF7Ah2rLEoaEDW1xPiL2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707167137; c=relaxed/simple;
	bh=kE9/rneg0If5GRScOGZRPrjdY0DAAFRtb6eI+LWHNQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYcz7gyqxylFJSx4EjA+dR7v/hI7Tgimu72St1iU54Xw7xahbmeZ/HeszcLHeNKmC8otRTmEvTqkI/YlC1ONyVEEFBy6ILdGM633yQf+36OcpmvNRLOFTgP0TEYtF0MRgQUmsjQLP61vXP/ZNADT0GQTvHNURPMIW5e+t4R5xkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X86yzpl0; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X86yzpl0"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5d3907ff128so4279414a12.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Feb 2024 13:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707167135; x=1707771935; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7bvGIlJxrBaEK1IQ+lwcuB23iyN+HVMCqSF/ag1am50=;
        b=X86yzpl0zSO/u1pGJQXYDoK0i45MbulhOaKO2WROdh6iSvVkqjq1+JGXUIziTouqny
         Q/e3CWf5PXM2T1sQhZdMSv7RL2fdHIHQ91Gjly160HTE+M+85oRwJJnyFZBlbw1N0ORM
         Rs8vC7wGF6uTNKIgyVbf4+h8rimlPUP80Xy/141Sh5nFlG4GyYzlbgpwXOuTGkrxpZ95
         OhwoOVRi0itMefLFomruHMKSRyQPxcGFK0BSqxTuDspp8k6Gbh8sAPkcamh1MpdaxxgT
         jbcl9y40K2RvwkS9kZENGHiAkjn55omfSuRZ6sNsz6HGURliblJaUIQnVEkS0EZzgoHb
         sYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707167135; x=1707771935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bvGIlJxrBaEK1IQ+lwcuB23iyN+HVMCqSF/ag1am50=;
        b=Y2ptCmwSN6md6JyNiN8XSzSNxZtDl1lP95jnFBBeKfM1dnj5xvkQWqm4nq8yQn6hWY
         6oBgN0k6ysASpJ6tr9t1vxCZYC5Z38um40YPDSsX6L8PTLPmJ1WUOSVJhhpW/9X0GOWq
         xs1IJTMNwpp6aysUc9OOSvKNUM/QN/QYn5iIHsLTW6PbWC3MDbWtyK7c7Qy8ClkHdnod
         TAMtvPe9mzbio9VV5kYx9Qz6uswbEtURPagp1ZOLN3FW2VkGl0wwUcUNvYZt1IHeeP0s
         46DTtISjqemObg3aJGNJUWJDimfO+/xwbb7ebAZr8zfK4fLHC4JU82sGDB+WmVMH8Jec
         7a+w==
X-Gm-Message-State: AOJu0YwyJ6BTZP9OsXa+z6P+Pgebw8gnYyk1KH7EjShS72ul7KmuOyEQ
	/02NmfNN+bl6HhLD7RC92Zf7GKExt8ksNZI7VqzPCKh0knH+6P7s3xGJT4sttASMgRr7Q1rwXRZ
	b
X-Google-Smtp-Source: AGHT+IGFxeGJgHeWCBU3cxRJPfpp4AspLcKROOrq9lfLd+CjheYALJrnG21SS4ALbGF0eaXrnPq8Gg==
X-Received: by 2002:a05:6a20:969b:b0:19e:987c:78a7 with SMTP id hp27-20020a056a20969b00b0019e987c78a7mr251899pzc.32.1707167135630;
        Mon, 05 Feb 2024 13:05:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWPNkU2uDafyqs0v62TqfxcTObszvk0yHfgLTi6UVhdfHMVp+wjIoRZAlx7TLFuUTy8MvyRFBNrU3XOFXb9msNKJfC34TpXXwd9jR1fkoXdpJGQOtM8nXBy5T90PgnItDVz2oVU+O8JcC8G7YLh/KDwUDFl0YQk0UP+yVxCzUlnHSkOM/EYO8qKCa9mtjU5EGUPtZltUn0NmIChJPifSUmcF4pkxfSXJIeaHe3Yduu3vj+JHVIuhtGD8d/c3OtCoymY87IPa590sol0p/kXkx4=
Received: from p14s ([2604:3d09:148c:c800:c88e:5ce2:4df2:aaa0])
        by smtp.gmail.com with ESMTPSA id d22-20020aa78696000000b006e04a659ed6sm319996pfo.67.2024.02.05.13.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 13:05:35 -0800 (PST)
Date: Mon, 5 Feb 2024 14:05:32 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Yann Sionneau <ysionneau@kalrayinc.com>,
	linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Julian Vetter <jvetter@kalrayinc.com>,
	Jonathan Borne <jborne@kalray.eu>,
	Julien Hascoet <jhascoet@kalray.eu>,
	Damien Hedde <dhedde@kalrayinc.com>,
	Titouan Huard <thuard@kalrayinc.com>
Subject: Re: [RFC] Passing device-tree to remoteproc?
Message-ID: <ZcFNnDDORrVuWKHq@p14s>
References: <9c32f94e-869a-16d3-6bba-064082518ce4@kalrayinc.com>
 <f67cd822-4e29-71f2-7c42-e11dbaa6cd8c@kalrayinc.com>
 <cc9926d2-4341-47b3-8b00-a33fbf653744@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc9926d2-4341-47b3-8b00-a33fbf653744@foss.st.com>

Good day Yann,

On Fri, Feb 02, 2024 at 10:14:08AM +0100, Arnaud POULIQUEN wrote:
> Hello Yann,
> 
> On 1/30/24 11:20, Yann Sionneau wrote:
> > Hello,
> > 
> > On 1/23/24 14:32, Yann Sionneau wrote:
> >> Hello,
> >>
> >> How interesting to upstream Linux would it be to have a way for Linux kernel
> >> or user space to pass a device tree blob to remote processor when starting a
> >> remote proc FW?
> >>
> >> For instance we could imagine something like this:
> >>
> >> 1/ user space does echo -n firmware.elf >
> >> /sys/class/remoteproc/remoteprocXXX/firmware
> >>
> >> 2/ user space does echo -n my_dt.dtb > /sys/class/remoteproc/remoteprocXXX/dtb
> >>
> >> 3/ user space does echo start > /sys/class/remoteproc/remoteprocXXX/state
> > 
> > Any opinion on this proposal?
>
> 
> Interesting use case. There is no concrete need in ST, but it raises the
> question of providing extra data with the firmware to the remote processor.
> 

I agree with Arnaud.  From a mechanical point of view it is interesting and
doesn't pause a serious technical challenge.  That said I don't really
understand the motivation behind the idea.  More details the exact problem you
want to fix would be welcomed.

> In a first approach, my personal feeling is that the ELF and the DTB are
> interdependent.
> So having a mechanism to ensure coherency between both could be important.
> 
> Then it could be interesting to address the need in a more generic way
> to be able to transfer extra data, for instance an audio tuning for a DSP.
> Adding a specific sysfs for each specific need could not be a good idea in long
> term.
> 
> Have you looked into some other approaches such as adding the DTB as a specific
> section of your ELF file,or adding the support of a new format that packages
> everything together (for instance FIP)?

Here too I have to agree with Arnaud.

> Regards,
> Arnaud
> 
> > 
> > Thanks!
> > 
> > Regards,
> > 
