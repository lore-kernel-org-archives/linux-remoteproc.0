Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4932D4398EB;
	Fri, 14 Aug 2026 09:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786698350; cv=none; b=T0HKiGWYLrKHKV+3vi2Ewl2DTheZvUV566wpvEaBqk/5QDG+csn4BLaV9vLhjxmTD/raP6juI/bF1MQNXCzgFSi+WPy0ZLu2aHCnXx5CGe025ngRS9xUmiGzN1wgHNkYkp7EGp6rDghaozOcLNLP6eZMj04zb9d57sgEBnBW3+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786698350; c=relaxed/simple;
	bh=RHjun/4S7LLktQHdatf10k19DNwkcsqe6BgKVGaEmIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kY6T1A7LZXHcraHwC39S0nGEcPeDNO0j1cH3ToqE9ZoFO+mc0k5ygxl+gA/1ZcsGl5FoLhUxKp3JA5631P/CZwcimiRygiU4unbADmAGjHDPyl3VJAAbQWypoc5pmtS1N2cNUkpWpj6eF1L+lneyezEMKBIXey53JxVdN/egf30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kkqLE5b2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kkqLE5b2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6F71F000E9;
	Fri, 14 Aug 2026 09:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786698348;
	bh=RHjun/4S7LLktQHdatf10k19DNwkcsqe6BgKVGaEmIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kkqLE5b2sPZ7jXgC9Ev8wZ7/v0K6h6opxfARAWlp8KSUVM/SH3LxjzRJ35TzA9mUe
	 KPjCNxo54A5qeYPmlOy6yNBRDm95j7zik84nICSUcQC6sEUj7l9FDFGU1tgz7Gfl25
	 bJj0yTDGJ7yBx7nD4jVInacYERTyPrgUezM947QbL+KwccVBzZSUCBZycL/frHfaK2
	 63Ixb0ubHppOUwwxDgQw4T8FC96bXeXn/7YD+cgF0zOgY1cI++J4h/Q2gUMvt2YWCY
	 k5hY4/vq10v9boKZxFtDUhqNSMFw/Kc8uMYilzK8ZjmwOxGqyR1GpXVj0Ci58o73DD
	 3c3jYcmkFwmxA==
Date: Fri, 14 Aug 2026 11:05:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kumar Patro <bibek.patro@oss.qualcomm.com>, Komal Bajaj <komal.bajaj@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH v3] dt-bindings: remoteproc: qcom,shikra-pas: Allow
 bam-dmux subnode
Message-ID: <20260814-modest-rose-salmon-7bb60b@quoll>
References: <20260813-shikra-pas-bam-dmux-binding-v3-1-167a3fb50d21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813-shikra-pas-bam-dmux-binding-v3-1-167a3fb50d21@oss.qualcomm.com>

On Thu, Aug 13, 2026 at 04:55:54PM +0530, Vishnu Santhosh wrote:
> Allow an optional bam-dmux subnode under qcom,shikra-mpss-pas by
> referencing qcom,bam-dmux.yaml.

I still miss the answer why. Last time you said in present tense that
this node exists there, which I objected. The answer to my objections is
to provide proper reason why you are adding this, why you are doing it.
Answer almost never is: repeat what the diff is doing.

You change something in the bindings because something exists in the
hardware and it was missed in initial submission, and you explain the
impact of that "missing".

Best regards,
Krzysztof

