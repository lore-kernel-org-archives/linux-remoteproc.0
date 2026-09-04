Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671B1416878
	for <linux-remoteproc@vger.kernel.org>; Fri,  4 Sep 2026 05:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788500623; cv=none; b=RRAdinxQDgremRMCDG4I54vAUbZzMEoJGBflWmncagZX564lpFlXBmJH154ydeDGL6CLe5incor2Au5zo0OmZVMF9ZnSC1uXXdMhxOXUtqVMpX849uhYGDf97Brfb5MmDylAMQ5KziZFmKNHyIfqyEAo+XFpgpzYOm3aK034X60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788500623; c=relaxed/simple;
	bh=87tW78USOIRu124aJptnXZ1ORwFWyuAoO45i3VE7Rzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRjRl4qPdFqVywjISlVp0zs17IlWEDKktSkYlJ0ADDdgdzD3cDdjM6Z21JpNUaRuCyQf1u8Xx9mcVnLChQID1pAFAuGKGAUiE5fEzqyotxcriN/gzoRprLK3/YPV2MyczsIvG83ms+yoiHSkuuwfVUj22A4iV95E4u4dWoBZSUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MSWx2XeQ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MSWx2XeQ"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1c9879395so576892a12.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Sep 2026 22:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788500621; x=1789105421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XxOcRRnDrKQlx91Y28n3fxGGvoUu/s1bIHpjhY19uNc=;
        b=MSWx2XeQ6YrKYuEm/m5Ku+TmLdgF3ADdeLrlhKjWuUYqYQsk7yysqySZ5F6SyNtK76
         eMAFuO+DBRnJvZ3w3JxHK5UB1g6mtzydM/mwbPM4GNNPVVTllQcKFMbDhAsZ1VzYs7kd
         9rir0tqJ43541t3lwj/+YOxuKm8DgoyrwP9ZFsZxm3Z64vEGHouWTDOTI8vQo1faapcD
         R+gO8HKSRtCVANqMSydPf5Y4iVfwVhxi1kfl9iXlaAecIMF/X2tGYwJ/QgEkWj3dSxdY
         96bHNVPa8OwG+jOZjx+XXNo6AX1S/x7cVET+dDm8PmEyGBD2UenaSmX33BP0hv+auRyg
         iS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788500621; x=1789105421;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxOcRRnDrKQlx91Y28n3fxGGvoUu/s1bIHpjhY19uNc=;
        b=SUtveACQVZL+qGKXr7sy8YdzqNyp5g2MjeNeXE7hSiAsveUb7o7fdc/7GWXYfGLctC
         s+gpVFqpSfuoVVRYsQ7KH0Js8x8lgo+FJGR4/TfsSh2j4Aq3GmYDi953kTtdMCycKF+S
         U1wHbfFaKMJaA4pP2ZiGFVaiwwqLcE1/LR0fP22OmlrqES1dT9VhXWl+S2MuVVh9PlPr
         u8ManIg0mYZ4Ftdd4+vuQzLEpZ/5zXTnqDYEnaLKy04frEcYovFr3rUVr/dSaQtUjU/t
         b8yviOawYw+qM1WHFE6eRClI1lvs2F82oUCNMiCISESkFCzQ7C46dWgUVHiJIzut95zK
         vGqA==
X-Forwarded-Encrypted: i=1; AKwUvBwW/FOP1IgeB9rdWK/NOCGPHtG6FWVByDT/XYrvI8ouWJZ05hjdwWNHKKTP6djBI2AZ9VQWJ9NtWxLK6jGYTfZd@vger.kernel.org
X-Gm-Message-State: AFuF++no7EH6C6S9/CvovARG7ETnIHpHcEck52lXYR7PDsewgVhkpNw9
	srS232DrkhvqDrhsKhGZBJx/l2m2qs6dLcVM78XFtMv2wU82Zf8u3T1zlrxq3JLRjGI=
X-Gm-Gg: AYBFou0okjrD8BUT596H2Hmkz6a0Enyd/p8opypr2511cuwCkV5QBw/HiuSHn5bBav3
	oTHwGlmuir1zhON01CKjtux7N6Iaa26eFAdL6rvPYq/MqN3fWWSaYhRF9Hi1U54Ak6DP7mTaWV9
	kh02yotqN2iCUueQ12sGCPgCnxsmOq9qkyimEKe/CSrLQc9Bcm8pBlBHUEmt0SXbiWF0DrTcuc5
	TYRsQ45MtJ8nGDqHCTBmpsPU3l+dpHjEgRHoKdtVmQDzJb7w3RM6hgwq+U5f23KwAdBBalRnv2p
	ml8DEBS8GCgx+H3eYtcUoGVgPERezdJkxviyb+cWwmj/Dmsgb1RL7LxwJKScTp0M1BnNYeiXbLn
	DlrECZxMngBBXMEfWhclISsFT/heuJN/K7Ign7oIIMGuHHA4S7i7FHE7MaVLQIxQuWwf9S+pkiT
	QW08iM5j3HRR+Lu81t6sTW2nQsJGZmKdtBHIlOrrhpwB3thlk4/3ar/kfpfe2I/eA=
X-Received: by 2002:a17:90a:ec8d:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39b26101c08mr5553870a91.9.1788500621351;
        Thu, 03 Sep 2026 22:43:41 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm3885069c88.13.2026.09.03.22.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 22:43:40 -0700 (PDT)
Date: Fri, 4 Sep 2026 11:13:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <appaikrdwu6GpSGy@vireshk-B250M-D3H>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
 <apmunD8bkKOu5_Vm@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apmunD8bkKOu5_Vm@p14s>

On 03-09-26, 11:30, Mathieu Poirier wrote:
> I'm proposing something like this:
> 
>                         $(transport) {
>                                 compatible = "$(transport),rpmsg";
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> 
>                                 gpio {
>                                         compatible = "virtio,device29";

I would just change a minor thing here:

s/virtio/rpmsg/

This isn't a simple virtio-gpio device, since it doesn't have its own virtqueues
and uses virtqueues of virtio-rpmsg instead. So this may better be a
rpmsg,deviceX (where X is virtio ID) ?

>                                         reg = <3>
>                                         gpio-controller;
>                                         #gpio-cells = <2>;
>                                         interrupt-controller;
>                                         #interrupt-cells = <2>;
>                                 };  
>                                 gpio {
>                                         compatible = "virtio,device29";
>                                         reg = <4>
>                                         gpio-controller;
>                                         #gpio-cells = <2>;
>                                         interrupt-controller;
>                                         #interrupt-cells = <2>;
>                                 };  
>                         }

-- 
viresh
