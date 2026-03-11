Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B157B652;
	Wed, 11 Mar 2026 06:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773210163; cv=none; b=FzRDK7n5v/gHSNc9mnf2X/k6qdfYvI/quXZ7VndxvoMXiertLHRMciSIsMuZdkIFxErecfLK4fH3ltutaQ7AxP/0ByxGxSZSrfif+/nWlHXB9U7ashGIg0ek8lsXzDXmora0BnwTqxQUEw2ZXawkEBoZ4XxYua4T8heI4dUI2dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773210163; c=relaxed/simple;
	bh=J+Yv2AjB2McolzoBkUIV05kHQMlPbhhlQ9GjJ5zmf6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jF49fVmrYVPdgpsybZvX3CNIGNwd28a2KmCzJHbWwbATHhU8R/KSAZBt9P0zhMR3PG/pGBiJIPEDXkXXPuudbS1cvT+wIl/b9moOzcd97W0W0ins4b3qLdbVY7RwpvGaQOY91kGLLHnzBdBXZNp4fQhQfdBQ4JT5i48CKNPgMJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCEQ2nK3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCEQ2nK3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52190C4CEF7;
	Wed, 11 Mar 2026 06:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773210162;
	bh=J+Yv2AjB2McolzoBkUIV05kHQMlPbhhlQ9GjJ5zmf6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCEQ2nK3MTCYwI5vsKINgfzINNpClvIwMW3M+GT2jtjFphR+L3bTmQSnCG7ggy+3V
	 PwV0zZSeaX7pYnHqG3b47h5ZYvQRaZBYa1dnxyOIIxAboXrIYzbRV/tEej+X6hjM89
	 178WDTH0Z96EYhRggTx7Ooc66Lisa+s0TN6JDzpFWDJOpxWRSvPtlzVWfGfZjGWeCL
	 Z/PW2iXfTkhiVSsW01F2X4RQ+PgzIXJA6Mxb24BvmP1LwR47oApUz0BfgU76iKoihJ
	 Y7dpXv0PBIXavSg15nIUpQJ+7ixRGHFVX0M+nCndPSkoDQlC96vS/wQaeK6ZVBIyd0
	 0Q4XEX1eE0Q1Q==
Date: Wed, 11 Mar 2026 07:22:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/7] dt-bindings: remoteproc: qcom: Add smem
 properties in documents that reference to pas-common
Message-ID: <20260311-meteoric-yellow-pogona-fe5cf2@quoll>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-3-0a91575e0e7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310-knp-soccp-v4-3-0a91575e0e7e@oss.qualcomm.com>

On Tue, Mar 10, 2026 at 03:03:19AM -0700, Jingyi Wang wrote:
> Kaanapali SoCCP will extend the list for smem properties, add SMEM
> properties "qcom,smem-states" and "qcom,smem-state-names" to documents
> that reference to pas-common and add maxItems constraints.

This change is no-op. pas-common already defines all this.

This should be squashed with the change changing pas-common.

Best regards,
Krzysztof

