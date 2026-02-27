Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9454A3542E9;
	Fri, 27 Feb 2026 04:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772166078; cv=none; b=LldE/sGDeLolcatua8Y34wOEozdJmvzlRQ4NHESa6Jw8vplerDiVaAGW7/iDRxtG9y6ac2GVeMMigHbjI/Zn/RnQSznB+seNaYG/MasdlXjhRIdsIJ1dtCsZYa9ijN6y+n4jHikUIoFXqy+y3TKur/j4e4fb+1vCYWOXaSRE8UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772166078; c=relaxed/simple;
	bh=DjhCwJelsHxDZr2A9nbd6G55W14Jv0FPsNstLX/ZETA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c+IwHtFAoG61aKE0s6U/MUKCvEm+ssjb6z2ho+hZzfVIWRp7cADq56vvAkwTvN47SVwSIb3M6hTcvbCHhSGxbSc4Yky6mc79GxD04vQqWfy3M/G3Kl+pdo3YQCXl5TW2kmQgKWNREB4IMZJ3jVs/OTMWiNP8JeO0iFET8f6t2QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=lDRlqMaL; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="lDRlqMaL"
Message-ID: <4c8e310c-ab39-491b-9a39-99ddbc943b00@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772166064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9n0A5zUZC+lx+LR4fd6ULnk460On2lLPIMiPdwgeFyg=;
	b=lDRlqMaLbqiYTHS9SlFw+sFcgiORpu7H2cD6sR1nTRI1gsNlTLmO4wB2dHs6Pbo7D8W2mk
	Kt9mksvkriB37vvj7wanoVOd7H+HqRvthfYEIrdPtKN0II+xPrm3W3DRTr2WjQD4ynPgZ+
	TnyfS/guUR13OM8DzYZlBHujN5KyJIqm/ssSxWB3okq8dnaVaxoZ9mNbWmKEmkTOWv1gop
	UgLt0UKUV10d4klh4/T13svGl3atZYKKgB8rI3o4gfjoCjYo/r3cR9Yz0GEymtN6LjXqX1
	a8JMKTxhYjzUtucdRrUB+bMvHjJigVw1egwxqFqXm9v2V5a8oYnnvDNFvQjWDg==
Date: Fri, 27 Feb 2026 01:20:48 -0300
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] remoteproc: qcom_wcnss: Fix handling the lack of PD
 regulators in v3
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
 Luca Weiss <luca@lucaweiss.eu>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, llvm@lists.linux.dev
References: <20260201210230.911220-1-val@packett.cool>
 <jup7hphwpa754gyhtcahz25glecp6ctpuxcwzvco6wrbokvnip@quw7hrauahsa>
 <ddd8b949-3f73-4e3d-90b9-be95e859f3b1@packett.cool>
 <mteufo3laiiuhcgbihxnossy4xfkxhct57mkav2fr4oxvaldp7@k6p7edkfgjt4>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <mteufo3laiiuhcgbihxnossy4xfkxhct57mkav2fr4oxvaldp7@k6p7edkfgjt4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 2/27/26 12:52 AM, Bjorn Andersson wrote:
> On Tue, Feb 24, 2026 at 03:45:05PM -0300, Val Packett wrote:
>> On 2/23/26 5:03 PM, Bjorn Andersson wrote:
>>> On Sun, Feb 01, 2026 at 05:55:03PM -0300, Val Packett wrote:
>>>> The changes introduced to handle single power domain platforms have
>>>> swapped the info pointer increment from num_pd_vregs to num_pds, which
>>>> would shift the info pointer past the end of the array for pronto-v3,
>>>> which does not list power domain regulators in vregs.
>>>>
>>>> This showed up as a difference between GCC- and LLVM-compiled kernels
>>>> on SDM632 devices, where only with LLVM one would get the
>>>> "regulator request with no identifier" error, because the out-of-bounds
>>>> memory ended up being zeroed. Fix by skipping the increment when there
>>>> are more power domains than regulators.
>>>>
>>> Is the error only an error print, or did the thing stop working as well?
>> It's a real error. Likely no one would've bothered debugging it if it
>> weren't breaking everything :)
>>
>> It was a blocker for allowing LLVM/clang builds of the msm8953 kernel in
>> postmarketOS, the whole reason to dig into this was "switching to clang
>> breaks the modem, WTF?!"
>>
> Can you provide me with a Fixes: line please?
>
Oops, did I lose it at some point? o.0 Sorry!

Fixes: 65991ea8a6d1 ("remoteproc: qcom_wcnss: Handle platforms with only 
single power domain")


~val

