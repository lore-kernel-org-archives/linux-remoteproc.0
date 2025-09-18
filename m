Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0146F10E9;
	Thu, 18 Sep 2025 01:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758159258; cv=none; b=psGpGJ0hjbB3HCp1khuIO3j10sJoY8sKZPLar0J29C+Tl0IMwmLxLxAmufw0khr0QYLbsNDyhFlllZBtxQmaOMfcy+BvgyyrDlLLEE1jXZQf8sLJOzbKfwfkeWdTNhNnl2kpipjZqjvhTzOo3q44c7DVbKN8AFF3jNpdY2ZwX10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758159258; c=relaxed/simple;
	bh=BFSypG+D8n2dHNguy82XXQgdB+Xd1CPeG5T2r6V5qP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdScBSRcTlXy/dj0HbinTyvUVvFYNFo/LzvvdRfCNz8DBGI9X+JUA+NJ1jjKKrqxwYHtX7AFye/uvHoZo85LFPWN4jOqneNvnjauOCXEnCcRi4KgQ7onmHtQdGunUCKh7Ep7jyVp8eFmsVX+xno0CbsoQrC9IzlhyVzurNxSLqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7gkX0Ih; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7gkX0Ih"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E2EC4CEE7;
	Thu, 18 Sep 2025 01:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758159257;
	bh=BFSypG+D8n2dHNguy82XXQgdB+Xd1CPeG5T2r6V5qP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h7gkX0Ih4xfRP5sACyXibIse6oaWmNkV1JNOJpUEK11Rh3H/EYUhkKv4RLTqJbs/k
	 oUQO5p4qoy+O326jJUPRPoVKUf+s1esqc7u8GWJNCvxdSe5Ycgujyxej0NG6EtcYbP
	 sbU2653+A+fAjLi0LGuk0/xZ4cD9USrMnnyvcdevupgASnMoHhVVEe+XXicdHnH2+P
	 hAknFbbSkp3LkcNb2fNoU8T7UTo7ilGprbiTm2egJSZFsWrPzwWdDVJrA5npXCWGGJ
	 DRL9EvOGEQo4WeQOf+5i1t6YhPtjjIxIPotDUCM0dAhFH8CNpbdo/BqF74KAYjA9X7
	 lMoYku+c1qkLA==
Date: Thu, 18 Sep 2025 10:34:15 +0900
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: remoteproc: qcom,milos-pas: Document
 remoteprocs
Message-ID: <20250918-optimal-smooth-lynx-6e9a7c@kuoka>
References: <20250915-sm7635-remoteprocs-v5-0-96526cac59c6@fairphone.com>
 <20250915-sm7635-remoteprocs-v5-1-96526cac59c6@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250915-sm7635-remoteprocs-v5-1-96526cac59c6@fairphone.com>

On Mon, Sep 15, 2025 at 01:15:18PM +0200, Luca Weiss wrote:
> Document the bindings for the ADSP, CDSP, MPSS and WPSS PAS on the Milos
> (e.g. SM7635) SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../bindings/remoteproc/qcom,milos-pas.yaml        | 198 +++++++++++++++++++++
>  1 file changed, 198 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

