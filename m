Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7C533A01E;
	Fri, 27 Feb 2026 03:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772164359; cv=none; b=GfDFvancn0WOy36z4rdEFNILx7KNvL4d48p88RTvIJv+LgaoaZX7H+dalS0UqGSIVtZefuV9Nn/1ZnOCS26fk1NDK+uVFIccrg+SUPGgGgIj6wYjC38A4G88ghzP3PgV5dkZU1PNIvpcNblA15mVCmY3nX87uiXm5Vvyn7y9YNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772164359; c=relaxed/simple;
	bh=sGcIi9R+H+rYlejz3LbbzLzmzqTMDT0m2GiS7N0wTHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZdqRCp/TnxV3Mji6l5frLAMojLJajnHVP/26CUPsGdzqc0SZD+dkU4/ZR7PP4hHhzVIFMmT7BKW9oa7cclOxQL1kJ8j0E2cFLKW4UBRB2pZazVQhNlSD0lmzrevxwyXBlP6YDjycdCQOSjRdWRiI1obhTgk5k0GFyZ02H/LT/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bl/CaEpa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bl/CaEpa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B7CC19423;
	Fri, 27 Feb 2026 03:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772164359;
	bh=sGcIi9R+H+rYlejz3LbbzLzmzqTMDT0m2GiS7N0wTHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bl/CaEpaUARa6Oyh6+Q0TcqnR8VOvXTMqZYbXr3BBHTjB47Cwk8KEjyGZpObZNz1n
	 ZxnigLbQI3Gf+rkoz37BGPLbUhC6OFGzUAJWcw/Jo2M+BPLZ2H2Ygkt1IzKdiUbvH+
	 DhGFXGmlexEEZHtsC8IrME0z6f/dhFFs6rL15r6dh6IolqqtAuvw0c9jhF1VuBWzSk
	 Onynceq+DDz9aBm7RHMF5epDxAtyqjL3Dkyv0PekcK1rpVLLpvPHR2XRyGyDxwHi1Q
	 a0S/K8APMxChudUL+KRFVORIwLMxiiVIkGCd55cWW64MQK1HQVS5U3WwNZ8bsLLZGe
	 O78k5YHQFRB3w==
Date: Thu, 26 Feb 2026 21:52:35 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Matti =?utf-8?Q?Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, Luca Weiss <luca@lucaweiss.eu>, 
	Vladimir Lypak <vladimir.lypak@gmail.com>, 
	=?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] remoteproc: qcom_wcnss: Fix handling the lack of PD
 regulators in v3
Message-ID: <mteufo3laiiuhcgbihxnossy4xfkxhct57mkav2fr4oxvaldp7@k6p7edkfgjt4>
References: <20260201210230.911220-1-val@packett.cool>
 <jup7hphwpa754gyhtcahz25glecp6ctpuxcwzvco6wrbokvnip@quw7hrauahsa>
 <ddd8b949-3f73-4e3d-90b9-be95e859f3b1@packett.cool>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddd8b949-3f73-4e3d-90b9-be95e859f3b1@packett.cool>

On Tue, Feb 24, 2026 at 03:45:05PM -0300, Val Packett wrote:
> 
> On 2/23/26 5:03 PM, Bjorn Andersson wrote:
> > On Sun, Feb 01, 2026 at 05:55:03PM -0300, Val Packett wrote:
> > > The changes introduced to handle single power domain platforms have
> > > swapped the info pointer increment from num_pd_vregs to num_pds, which
> > > would shift the info pointer past the end of the array for pronto-v3,
> > > which does not list power domain regulators in vregs.
> > > 
> > > This showed up as a difference between GCC- and LLVM-compiled kernels
> > > on SDM632 devices, where only with LLVM one would get the
> > > "regulator request with no identifier" error, because the out-of-bounds
> > > memory ended up being zeroed. Fix by skipping the increment when there
> > > are more power domains than regulators.
> > > 
> > Is the error only an error print, or did the thing stop working as well?
> 
> It's a real error. Likely no one would've bothered debugging it if it
> weren't breaking everything :)
> 
> It was a blocker for allowing LLVM/clang builds of the msm8953 kernel in
> postmarketOS, the whole reason to dig into this was "switching to clang
> breaks the modem, WTF?!"
> 

Can you provide me with a Fixes: line please?

Regards,
Bjorn

> ~val
> 
