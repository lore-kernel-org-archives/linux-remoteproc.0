Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F8C1B6D1A;
	Wed, 13 May 2026 23:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778714409; cv=none; b=DNxGuov3wtiV/AHq43aBM2P8vK5uUuzztalMDdntANHwlog/wvShk9kuz7gWapRsjMaOkk8YxNxGdLJKQoH1ZQpsOazSaRnJ949geYecLst+xNY9cBsUKNItYsfsM2ClBRQb3FBFPBnWvrjQtouzed9hje/APB3073iNlwbtKOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778714409; c=relaxed/simple;
	bh=7TTPL3LG2P8OfeFkwXeR/jGlgxkKCAcMwGn2yF3v1ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NuB4TnJoJZMzSbE9F1YZb7ITqAFeenQPL0Y2qGQRvabcYKDAY4jMEFaVvRRzMafFsa4GIfRLRZEOuuZyQUB/LUTzR3bhDeorrr/WhuL1jWV5aBqeddcvlwWKCpVGI2+knmoUY1syXbXHQDZUTzhUk2VWEQdLIb9dKqPN5shMMwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfEwWEpR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfEwWEpR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14C6C19425;
	Wed, 13 May 2026 23:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778714409;
	bh=7TTPL3LG2P8OfeFkwXeR/jGlgxkKCAcMwGn2yF3v1ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfEwWEpRqCWgqHbEsAlUAlh7rJ682620IbkoDzfP72lNq+dddibrzPBn0bgpn2mGI
	 CnX7ah0OlV5cCs49ssmJXCgrP6CMTj/9S1yJ9mEtqqnZDl4MTjOCrc80jFvkzmiy0B
	 sWJYPI4ht5twEABMIvEeFaTZ6RS4XHxHwr77THY7F8ZWI/4SqdLjOUTQN+vvIGr68U
	 sOQ38I0HsXypNjjc9F7KRWhtZ7Ut8fS26Q8gIaMzi8o6beLsT2giSlGK3YoIkW3IfA
	 G+rkHrox3WOlauYDLjDTNyrNJpG84PWvIPyAImMbpZzJfKa+OV6ozWS+FrjD3HTyMg
	 B7TpUn6k7vBXw==
Date: Wed, 13 May 2026 18:20:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: soc: qcom: smd-rpm: Add Shikra
 rpm-smd compatible
Message-ID: <177871440571.2291174.6393021319553027315.robh@kernel.org>
References: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
 <20260508-shikra_mailbox_and_rpm_changes-v3-1-698f8e5fb339@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v3-1-698f8e5fb339@oss.qualcomm.com>


On Fri, 08 May 2026 16:10:46 +0530, Sneh Mankad wrote:
> From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> Add compatible for the Qualcomm Shikra rpm-smd device.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

