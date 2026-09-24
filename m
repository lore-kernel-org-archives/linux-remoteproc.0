Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA39E145B27;
	Thu, 24 Sep 2026 00:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790208078; cv=none; b=Jt5ruq1ObYwNW45StyZqTv27TojLwYmwkvMk5TU30RP7XxhQJ0BGMyOJ04RVFhaKPJIX9s4+xSyZ5qp1hDBIK3sbitccE6qOHRQSB/D1PPdQEfP9aIV4fOqbuwHWQr5PJ7mkryjoNdRJTkdpYDJmnLXYz+11haVfAdrCYkDJGxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790208078; c=relaxed/simple;
	bh=46Q7RZqQ3FX4oyHD3t0KSOnYGVK7SothAZIo0iznciE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YagqdgppfNdAVYqcrB6n4toujxWgUqzaURQw66zxchxBNJNqRkHd+/QKaSOYPemm3rvnf0D3u66E1gGHDreYrwi0luzCt7PvftrVHuuTxXnnaFlKAnj7jLB7oj+UxlRYvwz5lm5cNvnQJmq5ozPLr67hLfbyWoOGUMe/gMb7gmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTVja/l2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTVja/l2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D6B1F00899;
	Thu, 24 Sep 2026 00:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790208077;
	bh=lBqdcT0EAj737HC1E0rWSRebtR3QCwsKsGpNadmOXP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nTVja/l2O/jLr/aSJG9dl1WdWWL5qtzaTXoEueDzdxHy+gEiwaWA+1M0NH+FZVtDn
	 bZzFPiterLdC9bKLtf6UZvuJoLOdx9rFyJ5zJ9cQMuxqSf1tTQgAirtyMESAL5dLmd
	 wI62OK2Qd0LxVm2k0JD1m8l7005/k64nbis3z4BG1wHTgqIF9mmCISJeOW2y++8hO7
	 0fvz9rolRUSlrr5y8/M9fjSt9/lPHpPZe/rvx/rS3RNKk5RJ6i/16EWptORsMjfWDH
	 5YLd+xPWGi/BatfDEnQhmziSTU3oM1HnX0iGd3Sga1HzVpPtbStd3UwvUDHilDUnMC
	 cQD1Ixf6RLs9g==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] remoteproc: Hawi CDSP support with per-PD proxy performance states
Date: Wed, 23 Sep 2026 19:01:12 -0500
Message-ID: <179020806086.529109.14942161183875416558.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914084312.3812408-1-mukesh.ojha@oss.qualcomm.com>
References: <20260914084312.3812408-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Sep 2026 14:13:10 +0530, Mukesh Ojha wrote:
> qcom,hawi-cdsp-pas was initially grouped as a fallback to
> qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
> Bringup revealed that the NSP proxy power domain on Hawi requires a
> specific RPMH performance level that the sm8550 driver data does not
> provide, breaking the compatibility contract the fallback string implies.
> Maili CDSP shares the same NSP power domain topology as Hawi and must
> fall back to qcom,hawi-cdsp-pas rather than qcom,sm8550-cdsp-pas to
> inherit the correct cx/mxc/nsp power-domain constraint.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas standalone
      commit: bdcb3b5116c36667f52dd80dd24b117cb8101ff5
[2/2] remoteproc: qcom_q6v5_pas: add per-PD proxy performance states for Hawi CDSP
      commit: 2eb7702db31d4b468bbb9380dddf1dd3443cac6b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
