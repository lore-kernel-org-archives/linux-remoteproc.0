Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA66307492;
	Fri, 31 Jul 2026 03:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468403; cv=none; b=cJnoUAjpkcaNAbA1hWeiVE5P9O4UPr3HVYLQ9nBfYHS1jvp7tdP/xya1b/uPgbS/dChJwErnUajiJJE+gCHmukU2OiNwa8DJmIrubxHpZAMbpzDjPzoh5TtNwZEW01zPdxUm1Uoi1Fl98HyUf3lZevjeUrFKDanlMlymDOSqSo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468403; c=relaxed/simple;
	bh=TPfDJ/mP9qMEGmlQvng+WyygIq8YIgcBonuWOoPZmBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WoYXvGmcUjRD+sJAg4xT3iInW5RKE4kxHUNTtP/zL/gbobmfcrz+DewuL0IlmwPlDZAC7yLRZir8Ei//Ngvompr9XJe2FxpySf5mk8TEY7xkKydqzcA6wABzteVPDlLOX8Kqd5cEBDqnKO4CRhRjMIYh89vqluEf8WfWss4fHVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZQuQeff; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZQuQeff"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02D71F00A3D;
	Fri, 31 Jul 2026 03:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468401;
	bh=e0NCj0EtcTdC8vo6K53ffF8ptu8b4gYEFnD0QJEbVPg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OZQuQeffmqGfl5xd7guzAQWGZsuZdrKPDEnWnoEC/lpnCB75B22/wA8p3m+WLB6r+
	 uaIp6GWskW7uohJIPSbsttSfLnQy7qnTSednSQDm9bGk1LjU6rKYeQC1OZFv9KfF1R
	 GlezFFI+NxMuQ0nMhSNp1Dq+U+rEZxxkLnC4ZSvuTihQKqZ1xOuj6TNGsznYuapeYr
	 6Zfy4g9kqBns4VjavAMLkCIrO+quQrkuQfLQ8zFG7QCuVLyRYaw+mV69aoDr7qIYlo
	 8wGfRoe8EDD35tDHA0c3K2s7aEI56vn5ZXN6LhROJxoS3KhZiD1XH836cNHKSW4UKQ
	 XDT7Q4K0ROMhA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] remoteproc: qcom: pas: Add support for CDSP on Eliza SoC
Date: Thu, 30 Jul 2026 22:26:33 -0500
Message-ID: <178546838831.317434.4935148477877585081.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722-remoteproc-eliza-cdsp-v4-0-04c6eee70cb1@oss.qualcomm.com>
References: <20260722-remoteproc-eliza-cdsp-v4-0-04c6eee70cb1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 22 Jul 2026 13:56:47 +0300, Abel Vesa wrote:
> Document the compatible in the SM8550 schema and
> then add the driver data, tying it to the compatible.
> 
> 

Applied, thanks!

[1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Eliza CDSP compatible
      commit: ac9e9980375bbec70cc4886842f98b2f471ccc65
[2/2] remoteproc: qcom: pas: Add Eliza CDSP support
      commit: 844d8f49e9d7f0621c10aeea059d59fd957bbd1e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
