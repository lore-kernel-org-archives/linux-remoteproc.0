Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251CC37F738;
	Mon, 31 Aug 2026 16:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194940; cv=none; b=Y3CoFU8j6rzrBYbgFRZ3x3wXQiPER9S6+ACFe4JsDHZ//OA1OnC2MExZIBWhCJO+nyNnomCFLu27V3IH0aIGLt+eYkJxdWXWGUtwOt1WrfpfDxWbzxIFrLaWZ544BoYKI7HLZF0rdiLKywgRYw9SEq63AH9LXxHopP58TwWHwp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194940; c=relaxed/simple;
	bh=LY4z+Aw1VCy6enQDJRc5LkyRsacT3IMun22T+Y2uWgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KpKme0j/51cWehkIUB6MdGLLnsNAYjOt+G9X8jeeOfHPZxvwoL9xHATPB4aZX9Y8s3y+kTlzL04YLcU9f/5ICQhB7Oy4NXhC+mBSFP2TxiAhCwkKHAz3xwbcM+eJms1wWWWK5d2QT9pDy5TmIKjOnu7bnWIstNAA0nOjbr15U0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JASK4iIi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JASK4iIi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1D81F000E9;
	Mon, 31 Aug 2026 16:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788194938;
	bh=MZYyFNn3q6VIRtfvDoxSvICAp/9kJyvM6DT8zuQtreA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JASK4iIiInhGoTMmZ9EZkPHipkn6OMjOiHwd3xjiLi39pvUrLGvGWaN1btGBnhaJB
	 RaVR4ckf352fhFwn7N8HAjFOOumhakg1qRJMqlH9UApgHYs5ar0yzIJoz9DTaQDy0r
	 eoQCMqp4Cvq/zvbh8vjOJAqbIa73USF410OZbsuuxrlGGm9qabwbI5bgF+D5Op296k
	 jN+52oAPw3uXPI3ujvyjkOUsieL6MWCgobPZYRFqwuTdA4yX7IAsa9wcdWJTsot5/s
	 ZiuJmY8EwRRBj/xoqd2Ca0nG42Z77yMKBHqtlo9vCzcUbX9nJgtQMeHSgKud5Ur0mz
	 h1L1u+Uqtk/Ig==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] rpmsg: ctrl: use kernel-doc format for ioctl macros
Date: Mon, 31 Aug 2026 11:48:49 -0500
Message-ID: <178819492789.1319417.16735429960694747271.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730052922.1610116-1-rdunlap@infradead.org>
References: <20260730052922.1610116-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 Jul 2026 22:29:22 -0700, Randy Dunlap wrote:
> Convert the ioctl macros to kernel-doc format to avoid kernel-doc
> warnings:
> 
> Warning: include/uapi/linux/rpmsg.h:26 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Instantiate a new rmpsg char device endpoint.
> Warning: include/uapi/linux/rpmsg.h:31 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Destroy a rpmsg char device endpoint created by the RPMSG_CREATE_EPT_IOCTL.
> Warning: include/uapi/linux/rpmsg.h:36 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Instantiate a new local rpmsg service device.
> Warning: include/uapi/linux/rpmsg.h:41 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Release a local rpmsg device.
> Warning: include/uapi/linux/rpmsg.h:46 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Get the flow control state of the remote rpmsg char device.
> Warning: include/uapi/linux/rpmsg.h:51 This comment starts with '/**',
>  but isn't a kernel-doc comment.
>  * Set the flow control state of the local rpmsg char device.
> 
> [...]

Applied, thanks!

[1/1] rpmsg: ctrl: use kernel-doc format for ioctl macros
      commit: 6c4fbf1ce49390aaa9db84cdaff5cf18cae46da8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
