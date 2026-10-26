Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010968;
	b=Qwvy4run885wvwl9YlR0nBYrEckAVoASo6iXHaDcspV3jmwhtxXoDQBHfifKHLKVuGSE
	 bnzIXKbdryKo4jw3zcylvpDJR7kWQFUPbhBOmcKZyNO3+wgDgI/0HxloWAvHBSWS1r7h5
	 HmeT4OhnPkzXNgkylJlBhf63PJvHgFe6xdqfE0MpRcfHlz3dgCzuABEWFtGGVVikcyK3y
	 WzVoS60Q5ZwgyElSyypSGK2K96vunS64t9k3Ismry+rB/NfanOnaXaHkgrIGmagdBX2uO
	 7wPm1XvG7P/aBb8fW0MQNM7Kutm0lh+U5iHgnvlfV55fQSlSAmNI1/qk3cDmR7ComTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010968;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wiYC8FKKY6yIiCegxoZNc18aTQxaA+JY0MjqT0B+I5o=;
	b=VBLJd/YNyDqK173V/qvSSr5SG3jw9yJmw9RA+O5z2Eela83JFf8ThV6BdxQ7WnZqVUXk
	 t/Ly3/mrz0UShzNhtzwGJdSBoV4afNch3m7+yDLbS0OzMCjcaZ0gnkCIxT4lvQBSk3Mcr
	 6Djs2NVhw8EWWbsi0RFk5KFYyQG+knI9dpNBvHq8mkOOvXbWwQbo8aartr52TWlbHNRUM
	 asbvfYtWe6i/kTwto4oI8yi6fZuKIXbpbe5gyHNWWL3l/yXOe4b66aBLaKPwNNsHvbl+n
	 W9D+wmwjjtARqlE363W7JwfQvEiNmyf5iNgtWriJfAXBuWP8YAKucdkW8LmrqQqd1GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKoiRomz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58A5606A31A;
	Mon, 26 Oct 2026 10:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKoiRomz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD5B1F01825;
	Mon, 26 Oct 2026 10:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793010967;
	bh=wiYC8FKKY6yIiCegxoZNc18aTQxaA+JY0MjqT0B+I5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kKoiRomzHy7VQ8JBPNRFtu3BEsorMA1NdfobbnZKp247ZFwQoRIei0Esx8UjZhrRq
	 yBxXve8dSiTxhJTtZh/CyvnRAE2ckjgY0bduMbcpFlIJe0VuY7u+URIfexAxqSerQr
	 RYiiow1QQGulBJ2/Xc2x1a7SxXve8qk+IKsLrephHPBwLhZsmblcv6PdnhGeF8+sQW
	 o3uiW+H+rTtMRVl8z5ap1s0uJaN4PE6QuNulP1hdrORz4ToV7eh1OAV1n0OfzvvHgd
	 JRysWcz0X1oPh9dUFU6OqU9oCN5qw4duFbcKN95Yu5eHNbDC5LQ9I1yWnHJNqPM6RX
	 5y1HjvO7JGzTQ==
Date: Mon, 26 Oct 2026 11:36:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ishu Brar <patches@brar.si>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: remoteproc: qcom,sm6350-pas: Document
 SM7250 ADSP
Message-ID: <20261026-dazzling-lean-ape-b2dfaf@quoll>
References: <20261024-adsp-sm7250-v2-1-ef278af8da5d@brar.si>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261024-adsp-sm7250-v2-1-ef278af8da5d@brar.si>

On Sat, Oct 24, 2026 at 09:24:27AM +0530, Ishu Brar wrote:
> Document the ADSP Peripheral Authentication Service on the Qualcomm
> SM7250 SoC. It has the same interrupts and LCX/LMX power domains as the
> SM6350 ADSP, so use the SM6350 compatible as a fallback.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

