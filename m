Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6273C2F4A08;
	Tue, 17 Jun 2025 21:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195907; cv=none; b=jkFzYIcaK8n3B4hpntTj2rubpOZIXItzUdl+AuMbH4TxJXjC82+/1e5avQsza9U178VAPL90S4mj/3Uy8+ZnCu6tOW1SjgVrByvCI+74T1sueD3eUvbdXwiPoadlQJgBTMJb+rTKW4z77TBl6AA+myHcLA7iRXP/MkSETW734kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195907; c=relaxed/simple;
	bh=SbaaBn9YmROCcSHwLAkbr+F/D/Y6oZUJFmCJs6KUFZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Th4IiWTlLdjSu/BSEkpjfpmTKLNkuVzj66H4fMtuijgUUHWFLbJT7xrqmhfEKApVHcV6ES/7MfB7xrO3tD8WA7j6voX9vyEI9KkQ7A8Ls3u2sV4XM4QJ6DX5TVqo68gtUjErDEOpMfKezu0UeIEnXP9VjiKqeY5HALHbyF1uM7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZ6Pg0MH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZ6Pg0MH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15EF4C4CEEE;
	Tue, 17 Jun 2025 21:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750195907;
	bh=SbaaBn9YmROCcSHwLAkbr+F/D/Y6oZUJFmCJs6KUFZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gZ6Pg0MHctFDZ0aYcS/9kTQ2A7lJ84inZd5i0Dz4b69iApY/dII3edyP2+EMxNwa/
	 AWtpvaGiqLw48FJGpL3CtdEqjXjJFxRrCiRNjelTbEF6UYafDqID+/5EdB7F09L7hx
	 u4h0tQpywlS5p9sBdaufVTyFxSLpmfJtir8EZsEQrVfCIYPxW5lr98CWvRRHGI4IY9
	 HPmMRAkvVOgcoa0bIl4TI2lPv+sfAsxzsoj6mD5ygrvm2D1zr4lRqhMKEjZVuDoI5f
	 q24L9hMIvC/o2ITwiClpT5ounie/1OBjOO60r31U4EeCfSVIkHQ3q50TfivF4JrytD
	 EyGMapabmMJSQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lijuan Gao <quic_lijuang@quicinc.com>
Cc: kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Kyle Deng <quic_chunkaid@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/6] arm64: dts: qcom: qcs615: enable remoteprocs - ADSP and CDSP
Date: Tue, 17 Jun 2025 16:31:30 -0500
Message-ID: <175019588863.714929.13477145545211936334.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526-add_qcs615_remoteproc_support-v4-0-06a7d8bed0b5@quicinc.com>
References: <20250526-add_qcs615_remoteproc_support-v4-0-06a7d8bed0b5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 26 May 2025 13:21:46 +0800, Lijuan Gao wrote:
> Enable the remote processor PAS loader for QCS615 ADSP and CDSP
> processors. This allows different platforms/architectures to control
> (power on, load firmware, power off) those remote processors while
> abstracting the hardware differences. Additionally, and add a PIL region
> in IMEM so that post mortem debug tools can collect ramdumps.
> 
> 
> [...]

Applied, thanks!

[2/6] dt-bindings: soc: qcom: add qcom,qcs615-imem compatible
      commit: b0123a8aa9dda9c89f0fe7d30a87c03fcddfc505

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
