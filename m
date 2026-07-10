Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBE5233D9E;
	Fri, 10 Jul 2026 18:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706837; cv=none; b=r4yvln243p2mI61sH5Q2dnF8PLyB0or6dgdzw3RX/jfPEfhJJcql7zb5URpCAxHvkr8KnOPFQn4jYiYgz3eVRcWWko93S7LZdp4a0OfBu9wzdnq9KCvo5LZMNwhVMcWSp02SXicPzyOyzIkjQB99Q8nHI1CNp2eHq09Ap2zY3jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706837; c=relaxed/simple;
	bh=R+3xuU0fGxeS4VtZIuWRNl8qODwyCTkC7JZ7Z+3a2aU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d4h9/YFbNIjr4/fJ8dolhTgGk21WdVuEzqBPQdCaRhB5r20Qz32FGDjW8KtzR9nUiaWhkln82kXpDF/zokO6VQtKjfb/pJArkAIBh0spu8FuF5uYYLXlbpqbezG7G04Y35Sy9xMUOk1Sk28qWKsEeGPZn15kNYXvSvGNMN9NNnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJUC6Hcr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJUC6Hcr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2311F000E9;
	Fri, 10 Jul 2026 18:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706836;
	bh=5Xgwd6CE7fFT9Yo/GH1TxWishV+zovn5eviinx1pMPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BJUC6Hcrr3+kVBB/YidRUGKIx9M+oGUfEkslIbogo6IA/bqN6LxiRX7LvFXmrXw5C
	 S/Kx8GSbwUSzmazzvacwFT4sJ+3jyNUHIO90CaQngVjP2OxPIgCVBA+UI54F+3eGpL
	 afTE8JXvwpwhFhat3NiY0K/rPiArgskiU7KW7IV3UXjBzHsjD1Z8LNDT8O8zhwyfC8
	 S03fez4XkTk1M8TH4ay/X1vGkcpbTn7XgJGzsTqDnLzLmFtkMk5pLbGc51cvBv//ZT
	 ZVdqv940QN1Vgcl7NRIXgRoxjL+kFfIaiyL2RZVfuaTw9xcgLr8RKM7XG8am97q6Z9
	 et6CKXR+JIDVw==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Make handover IRQ one-shot
Date: Fri, 10 Jul 2026 13:06:59 -0500
Message-ID: <178370682992.2572738.5569287299808984621.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612-rproc-q6v5-handover-irq-one-shot-v1-1-bb688f4446b3@oss.qualcomm.com>
References: <20260612-rproc-q6v5-handover-irq-one-shot-v1-1-bb688f4446b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 12 Jun 2026 14:09:08 +0300, Abel Vesa wrote:
> The handover interrupt is expected to be consumed once during each prepare
> cycle. If the remote processor keeps signalling handover after the first
> event, qcom_q6v5 currently logs the duplicate interrupt repeatedly while
> leaving the IRQ enabled.
> 
> Track the handover IRQ enable state explicitly and route all handover IRQ
> enable/disable operations through idempotent helpers. Request the handover
> IRQ with IRQF_NO_AUTOEN so it is only enabled through the helper during
> prepare. The handover handler disables it after marking handover as issued,
> while unprepare disables and synchronizes it before checking whether
> handover was issued.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom: q6v5: Make handover IRQ one-shot
      commit: a5c0d4e3d98ffe9d853c8b06018f7782683215fc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
