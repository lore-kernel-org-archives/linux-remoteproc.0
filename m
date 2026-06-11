Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E561EFF93;
	Thu, 11 Jun 2026 01:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142473; cv=none; b=NUYAzAXfGcZK5k2E9esZl6b4H4wMYFbMcM5ch9N7ss69yeLZuYBJ1bigQ6CkrwQF63beuikKbxN8CU1hqYSHOuBn/n0y9R+j8RutCmBWpuj5DSIVS6CPAoIhgnLxmebOypzfCRY+vM0/T3x/vJda86Jnvb4akqnD9YMUWve0xHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142473; c=relaxed/simple;
	bh=an5+Phs7WOHTvtkxyvMcWcU7I/voWjG0m+oVSgcSXHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uuzPsms5h+ukD14jVOyODdLAWtnFfaIf+Q2Wz+3CtDczoa7tPvMNHarSc6jMURtqiYUYXYa8u60T0nXQvY87MWENbDMEA/eix0FaFatoQ/+xlYZ2T/k/9/ARgtMUv+byjlDo4g95YBIi+JLOV9LHLAqFaUSEfl5vcb7LRoIOM44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFAsMHyo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFAsMHyo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360061F00898;
	Thu, 11 Jun 2026 01:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781142472;
	bh=Ze70WVRR86IRgbm0GMzr/QNM+abc0/lu74z148X5ohA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CFAsMHyo/QAX82e/t/fR8ubpLtrexPWfqJRiSf/2E1mMd6cE1vNyFZluPhxeBTzzR
	 vVSYktmSjw8YYtGpTaotyChQqSWQh0wV/hW/nrkSNORZoXPc6ePSVGuoSfsdqCbMfB
	 EwFPTTX+ve50IYSoY/hSnZe+XL6DGGxPPLL2PxSc65b24G5/j5gOJtPqG9OOpwSCWz
	 taNP2CuWWwmcTNezCDA4b+9094IjMMUeSxEF0J6NWB1IfN172KBKtqo5Mkm/MoOJu8
	 dg5CEpCQDfUPFUlHJVqgi/VZ36f1Zz53EOXqfnI+wVhYgzMRzIvpqIROvzFzkZog0D
	 5ZSo8S36rXz6w==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: Unify user-visible "Qualcomm" name
Date: Wed, 10 Jun 2026 20:47:41 -0500
Message-ID: <178114245718.590736.6428568100226874946.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422083334.84294-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260422083334.84294-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 22 Apr 2026 10:33:35 +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom: Unify user-visible "Qualcomm" name
      commit: 955e3852ad4fb65effbe1064d9f967964d6ee542

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
