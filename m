Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418653C10B1;
	Tue, 21 Jul 2026 08:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624055; cv=none; b=ozI5GtRURPLnmmyynA7YS9Z5xAcJKunk7kUFoeZLkwBkq/Cajq6n3R3rjr7rKkmwRr+IT10rqjU/pcLHmvjyrrm4Zbkd7WsdJbqHPImHORSq+dKUBy7Y2np2aZLvuoK/RJueEa4/9kG2bAiSiQzocPi04aF58zbUiZku+XNHisg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624055; c=relaxed/simple;
	bh=ogdtKDULKivB+pd10MS+cA9ThlYxgoCbhvBxXtoBxhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfFIvAx8GNHOQP5AbuVg5ueTdRhEzI1mMFdHRK3s8UAnZI9yR64oFsgABghGeJ0Nrd8EJRlPuqOspcgUCPsMhuHspOl46ZwJ386Oqv5+Z01FIvuqYLquxpR4vZ1opoJiU8a1RrTa6bXs5+pG8ZwD1Tr8uV1JU8HwVgqgqYIf/Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RgKReqT8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RgKReqT8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723F31F000E9;
	Tue, 21 Jul 2026 08:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784624051;
	bh=QF1yjCwSE6ADGuG48vym8l388SJcmoB7CoDUZDSwGcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RgKReqT84My5hFok/HIjqth5uFLHqNuLadgyLUsCyXGq/1fAtPZgantSeLWXJhO1l
	 RIHlkzPg467XrjM77+ABXK6Yp+AW1nrV3SPNW6jX+Izcghv+SrOOEvBrLvCxyn5sA7
	 gunqvtyGkH1NsvooBzaZIdhPqmLwzH6BlgsjEcQmQRgo8F83gD8LHO1Nt8hcOREXxv
	 nqtoyunHfkXr2xeWtDj6hS7jtDfkdOdOhXelynAzfkvWzng9C4/qIP3PuZMGJ40lx5
	 +KuTKAZrf9nDfaXUhkLCOvMZxP+2OI/s46VVg/ZgxkPXktzpQhCwPei8GREfc/cD0A
	 EbPZYBNEqJHJw==
Date: Tue, 21 Jul 2026 10:54:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: Document
 Nord ADSP
Message-ID: <20260721-sepia-kraken-of-authority-a5ff1b@quoll>
References: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
 <20260709085149.4072181-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709085149.4072181-3-shengchao.guo@oss.qualcomm.com>

On Thu, Jul 09, 2026 at 04:51:48PM +0800, Shawn Guo wrote:
> Document ADSP (HPASS DSP) for Nord SoC.
> 
> The Nord ADSP use CX and MX power domains, so add a new conditional
> block to enforce the correct power-domain-names for it.

Then this does not fit here and you should rather find other binding
which fits your device. The entire point of splitting the binding was to
avoid 20-if-then-cases because they are unmaintainable.

Best regards,
Krzysztof

