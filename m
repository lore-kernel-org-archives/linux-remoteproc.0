Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D5247604E;
	Mon, 31 Aug 2026 15:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191877; cv=none; b=JQ3insOmAU9liUvPwLlWxbZgkG7YNZPsaArlKspDhHGcW3ZbSC9OA4GlFUDPbQYcoauQYEwwHE9q8n/Agliyr1ZuK9CwL03hseAoZbSkan/08cTJI+N8CuWSIRItAnfkUOpNVVzHo3K1PbNkXUJmttS4WEYeYvtKs11G6nNKAGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191877; c=relaxed/simple;
	bh=WDLVHm9dkrUOpib9zOihdq4kmMvOMIvt1+jftbydDh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kopX5lVu5XzU6o5pMR4WcNzKzagl1Vz7XCnANJ4aRpM8i615TLR+0eyQxwVvWLoK15K/ruVbZ/9tT6FolUMTRCc1MzybPD5DAzSBOEHGvHzdgnqwIvPIRiRw7Ge9I5GIQ1dp1+i0LAq3rdEITMLTGpXUip7phCxH+pEmRQAG54s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FrlRxcK4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FrlRxcK4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074EC1F000E9;
	Mon, 31 Aug 2026 15:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788191875;
	bh=RtOp+UDyPYy2p1IS2wZS1YkImAbCRp6YCurH/tnLLJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FrlRxcK47QCzWgsa6+UzCSWYdbDStTYzDdARRCTel7dCPSWLHP7o1IqtehdgVoGM8
	 H0QS0qxpTYfV137K0eJsaxeNVGYiLF/216/PoL+drGlM3c1Izp3Ja80VpsZ7napxVc
	 1ec/Ze2uM7o+Ko6BRvWneU+hxn1OIB0bTawZcxltXk/wp2RbPKosvhMBDqtNdMKWXb
	 DzyTvsdY+CDss2GdAcdFxL/cwSRbQmEe1CNczNXYM/A2igGKlPqpudqTphVjXKKAL8
	 VrlNAVo/wIZwyv24a7TC1p93zgzfl8Ot3iIs032H7QF1sdci84AMvCIcxvDbC2eZlQ
	 3rsOqwPafWZjA==
Date: Mon, 31 Aug 2026 10:57:52 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] remoteproc: qcom_q6v5: Skip handover callback if
 already issued
Message-ID: <apWkZhJ6ZZAkcd2V@baldur>
References: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
 <20260828181311.4038346-2-mukesh.ojha@oss.qualcomm.com>
 <apUWoCCfgthl40AZ@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apUWoCCfgthl40AZ@linaro.org>

On Mon, Aug 31, 2026 at 07:52:32AM +0200, Stephan Gerhold wrote:
> On Fri, Aug 28, 2026 at 11:43:10PM +0530, Mukesh Ojha wrote:
> > When qcom_pas_attach() is called (subsystem already running at kernel
> > probe time), it sets handover_issued = true before enabling the handover
> > IRQ. The handover line may be high already (from bootloader boot), causing
> > the IRQ to fire immediately. Since proxy resources were never acquired via
> > qcom_pas_pds_enable() in the attach path, the resulting handover callback
> > calls pm_runtime_put() on proxy power domains with usage count = 0:
> > 
> >   genpd genpd:0:d00000.remoteproc: Runtime PM usage count underflow!
> >   genpd genpd:1:d00000.remoteproc: Runtime PM usage count underflow!
> > 
> > Also, because the old code left handover_irq_enabled = false after attach
> > (fixed separately), the handover IRQ was never disabled inside the handler,
> > allowing it to fire repeatedly and generating multiple underflows.
> > 
> > Fix by recording whether handover_issued was already set before the IRQ
> > fires and skipping the handover callback in that case. The callback
> > releases proxy resources that are only held when the normal start path
> > ran qcom_pas_pds_enable(); if handover was already marked as issued,
> > those resources were never acquired and must not be released.
> > 
> > Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Shawn sent the same patch already and the same comment applies here:
> https://lore.kernel.org/linux-arm-msm/amxf7MODINj26a4m@linaro.org/
> 
> v2 fixes it properly:
> https://lore.kernel.org/linux-arm-msm/20260801011731.1084591-1-shengchao.guo@oss.qualcomm.com/
> 

Thanks for the pointer, Stephan. That looks better.

Regards,
Bjorn

> Thanks,
> Stephan
