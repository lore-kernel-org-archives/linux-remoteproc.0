Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E2623C38C
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 08:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569081; cv=none; b=Kw/8H2Eq/zVyktwjGRHN+SD0nT8NtcD0jTNne8f3gM5MdPC86Ftb1/guJQSEJpsFN/uwG4w2ESl5yaC8zbJywqNcbux/aDsIicxKgSAKgDfGhLoCCLJUcYUfC4uE9Z/lC84ZncfepexjVqitudcTYOlFqnsLOsS3P0zDeye7N1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569081; c=relaxed/simple;
	bh=ockCoErXJYNNWIE4F1OGfTdTciM14pc2rGFj8KF/fos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZi9iDYFKvJ4LIxL1rbhYHpdH9L2JmeCBS8XXOs/NiT04bPIURNJbhyZ7lXtE/GdSmRNEsF+1rI/b390AGB6H7rKwSNWbaHXhAL0AmHdkVnk9nKKtUEOrtDBNPpnTCwxZMNlv1aSoQIkzKG0Fn34pioQMKUii5DQFIhdth89JuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i8KCNbjb; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i8KCNbjb"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ede096d73so13908625e9.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 01:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745569077; x=1746173877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pIik2Dicc6zrNNPkgRyVhu5BjNjWoGlcqMwS0QNX8Sk=;
        b=i8KCNbjbmdKc4sIjtJQPP7WgaU8u7kgQvvJRDHolwlBVdzQNI9ZnLo81t6/elcoa2k
         NUlaEF7k01WJT916nRHvbKnszFcNNlbw4nove37EEIIoXPLw0S1h0mJH8J4phPb1gJWx
         Zku/gMC7L32R8ibcJfkj+eBWyLn8Pi3MnTJaD8XIOEkBoP/VKl2cA+/9OSwvILIi+mjn
         fBW9W5Utg7nbmYjM3S2POgZQ9q3w6nsPAsh7LvqS1oNUGJe7cOTruTBSDuzPveswgDoz
         td+zByLQKPBhOzRw1zB+EAhdDTeJJstKvhOYG8JF0hDcUkSVrjefeA5c1msW6+gwu+w0
         hZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569077; x=1746173877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIik2Dicc6zrNNPkgRyVhu5BjNjWoGlcqMwS0QNX8Sk=;
        b=uFjKTPWHAT3+o4E9RKhW3w+zTvNH31KXhIGE8NCKZ0vXwV1jv0gqrWeTVFBrKQX52+
         bS812vDZTeFHSXGMAYeT6/2DlZ100Vk2HvOQ9+uEZ7eelZqMB1+E1zSVSTNi57MjaFVl
         FZ3Brik0AdzQvLYnCSA+rJ28hPpDMouKFVgYjZ4Wla6wj+LOf6HJftg3k18dbtOv7LIk
         gWR42ikuW3jbTu8i3ZFVPTdiQDcIWaHv5F639/1sktTFka3zVr0A88OcNj7Bum//DeSK
         2LtfrlXPLPdXjKjYAu8c0OlleUxUJIb5b00ZECU+gZGjZvHs6jkfXm3cAkm1uOB+kA+O
         Zpsg==
X-Forwarded-Encrypted: i=1; AJvYcCUQKIr95iSuNe7jLzTw3c/btb8+W199QILuIwAl3AP3c2fjbM7zYPIzP7iut6R6tBPU6RXspeMrXwu+U0sTjE8a@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy2JCuk4MT+DmA7Wvbgjk9mkEBo7Um97G0ajR5UPhNvAPDGBk5
	rfxQU3TFAWq6p7Cx96UewHgjd04WoFG2POu+TnPfnl1sd00jd/6Q/vCIgXANDpw=
X-Gm-Gg: ASbGncutpK4HWjEghbjzlZgOf4X05vDSDteiyhfxMnzeWI+yFTRP+fIfb0uHJLgfywQ
	RZdFjhly2yFl2cABAYzAo/V0g9/vnwfsJcUdHqIx4I258rSMSSAVvoHZrhIDLAWXqsSesMknOxE
	s5d/Ce9ePY210TFhLYvN+BwVB46SQXyMhB12iWTihg7dS6HFXYU3v7dy5g/uyfzAevN+HHVLEJt
	hhQLzBucKzsJ0rfgucL1ipCQBGlqrx3HNkWjn38jO8QJ9gcJlh92Ysy+AJ/87D6jHXNkJtgNn5D
	JkACgeP/xfw2Kyd5d56OivPRftzB2LjiejRdkUFCAvSivw==
X-Google-Smtp-Source: AGHT+IFtIhw338SCwM97fT8DE36JSktmwAws0V+m2whiTCc2WvjhYcfxYH8N3RZVkd/V19BgPW5uag==
X-Received: by 2002:a05:600c:3d0b:b0:43c:fc04:6d48 with SMTP id 5b1f17b1804b1-440a6346aabmr12093055e9.0.1745569077572;
        Fri, 25 Apr 2025 01:17:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073c8d1a5sm1671072f8f.13.2025.04.25.01.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:17:57 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:17:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org, patches@lists.linux.dev,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in
 __qcom_smd_send()
Message-ID: <1cb8c180-a93e-4d5d-a17a-6452dd154801@stanley.mountain>
References: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
 <aAkhvV0nSbrsef1P@stanley.mountain>
 <CA+G9fYu1GagoVWnhNFnknWf0_zk-O+5XQXDiL-XUdt8knhJYaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYu1GagoVWnhNFnknWf0_zk-O+5XQXDiL-XUdt8knhJYaQ@mail.gmail.com>

On Fri, Apr 25, 2025 at 11:36:24AM +0530, Naresh Kamboju wrote:
> On Wed, 23 Apr 2025 at 22:52, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The "ret" variable isn't initialized if we don't enter the loop.  For
> > example,  if "channel->state" is not SMD_CHANNEL_OPENED.
> >
> > Fixes: 33e3820dda88 ("rpmsg: smd: Use spinlock in tx path")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > Naresh, could you test this patch and see if it fixes the boot
> > problems you saw?
> 
> Dan, This patch fixes the reported problem.
> 
> Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> 

Thanks Naresh,

I left off your reported by tag as well.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

regards,
dan carpenter

