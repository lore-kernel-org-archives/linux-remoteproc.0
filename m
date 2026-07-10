Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C9537C0F6;
	Fri, 10 Jul 2026 18:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706848; cv=none; b=M66oXFrm4kGqJOD/Xa7ZlipeGdPCzwC9/wnZJmKRcPID6/M29uWECAAyaVabvy+El8bzsi5m3OPm9JtWPkbQWlFPLQLpkWJKWF/jaIfW1Jjg8G1ayIm9IWinA5jDZh5pTC2s7Z9ioNeHnlQsTfup3DBZk0g9p2LYMYJN6qvfe6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706848; c=relaxed/simple;
	bh=Q6wt/h32zDSUjWgfmdr6fSoDRafx4CxAPkUIm3xpkFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S5xvEqr5NhTxZmDY4p3Wghg5dypvLCt4k/DSsc8JxGjdi1AuBP0orPIz1sQouhW386IDIFArRnLNe75Db8pw17p3umhdSkWhnva5CYzE60mKbiNm4ODCA6KsmSE2g8+DumxBaUCDD+OwZOXbTb9lh27l8Ojyy25PeNYcJuIpiNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c59BW8eg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c59BW8eg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F041F00ACF;
	Fri, 10 Jul 2026 18:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706847;
	bh=nkV2DbaHgVJj2/IyHSADBCUmwwWfdOmmFIDSoyqP328=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c59BW8egSe/iCT+/S3F9Ac5W+7YufsoalW/9Is4ju4zE8CxN23RV+qKv3xHiuCPJb
	 4Rcnkwyf2X4FadHlAglA+aPBFn+XJOKKN9YlqA6aVDcVv2K3YHpGn+C2sHIOc9OecJ
	 BiKnLaN3KA4a0VKeOifFVU4+168tna5nPZ8N6XC7DBypPoYQeINd0rbafcYO0iAG3C
	 FvxfhQx9BgfRyjmSUZzwLPCliUX0Eok6KZ5XVelejsM1o8zCnDsBASkd85eAqvBXXC
	 TT6JLt3TDVqq6eFYDLHsGwrJX50PGJhraLuZ/PtlKvEAzyNV9f7fH++H/vQpovWxMs
	 qfubzMf+T6gTw==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] dt-bindings: remoteproc: qcom,sm8550-pas: Add Qualcomm Maili ADSP and CDSP
Date: Fri, 10 Jul 2026 13:07:12 -0500
Message-ID: <178370682993.2572738.16116733255201981104.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615-remoteproc-v1-1-67721b4b052a@oss.qualcomm.com>
References: <20260615-remoteproc-v1-1-67721b4b052a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 15 Jun 2026 16:30:21 +0800, Yijie Yang wrote:
> Document compatible strings for the ADSP and CDSP Peripheral Authentication
> Services on the Qualcomm Maili SoC. Both are compatible with the Qualcomm
> SM8550 PAS and can fallback to SM8550 except for one additional interrupt
> ("shutdown-ack"). For CDSP, similar to Kaanapali, "global_sync_mem" is
> not managed by the kernel.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: remoteproc: qcom,sm8550-pas: Add Qualcomm Maili ADSP and CDSP
      commit: d7f6a97be70592cf3906c95428f8f1dbbc9f38dd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
