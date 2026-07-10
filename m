Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBD437B3FE;
	Fri, 10 Jul 2026 18:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706842; cv=none; b=e4Mo4Ym2zxZy7piMJEbBvcoz5oknPY5IoUbO8l+4Oh1m/A3EWBdxh71ir4pJBg9kEGctGhwvQaBdavCCnl6ozxnbzNuz/eSX9bwdAiKFKJwVGX61HiWHXXAtSzPQjpc7v6RASod5AEArFEAkzvVJ9xD5rpSm5SBxlwgVPp/Oxgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706842; c=relaxed/simple;
	bh=Ea2dc/zQmoNHDSZIjzgfaOeZ+qwH3BXjDCO5+0emuis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uh+V/EPr0JRGNBO/A0gKkblDGQn3S8022psoaXTY9gIbpFa19bKAEY+ILyuLfPXerZeLneoxkFtWTCxMlQXKvDWD0402UmVt8j1/9HLtN4ZA1wSKwQ0anYSpK5DxI+Wbe65xMLB4NS/ASJG0C2conPj2QDK8Z7oN5sQB8kyE3hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ko+HQ5mV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ko+HQ5mV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687DD1F00A3A;
	Fri, 10 Jul 2026 18:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706840;
	bh=q64mLoIKKO6acehYZpPZaLa/VgE/uGU2tHBrQbnJjHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ko+HQ5mV6YOD+yBIhB5MOp3yEwOS+SM5J68ioNNDx71Y3gJNlvXGjWmHmSm7p38qo
	 GIHCXvlIfgVMbMFZ3Dis2HPndxB3gypOoQ3PqmVpPgYOr+Jb5gZDxDzVhUVRg/VczQ
	 /9qOWtihxB7LiKWVr8iZfyJffSrk49LLvlWqCY3l7X1B1fuRNzoXnTm7Dz1kDpojv4
	 3pfsBUHHeQUCAR3cw3ogO9glxIDoHt0xNCYpzuPlgQ/t64HrRi4C4E1M5j0HyZ6Sqt
	 HcZVyMfPpp1+HR55R3E7onMSH1IzL3UsqV/Wc8a30MYsznMQR70gGgrrkQQgT7QfZ9
	 S3+8T3BUd5p6Q==
From: Bjorn Andersson <andersson@kernel.org>
To: krzk+dt@kernel.org,
	mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: mathieu.poirier@linaro.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574 support
Date: Fri, 10 Jul 2026 13:07:04 -0500
Message-ID: <178370682987.2572738.13491033810212556744.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 08 Jan 2026 22:33:35 -0600, Alexandru Gagniuc wrote:
> Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
> driver. This firmware is usually used to run ath11k firmware and enable
> wifi with chips such as QCN5024.
> 
> When submitting v1, I learned that the firmware can also be loaded by
> the trustzone firmware. Since TZ is not shipped with the kernel, it
> makes sense to have the option of a native init sequence, as not all
> devices come with the latest TZ firmware.
> 
> [...]

Applied, thanks!

[1/9] remoteproc: qcom_q6v5_wcss: drop unused clocks from q6v5 struct
      commit: 22afc6163c0c7a144d24a09352b87719d64d5f65
[2/9] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil: convert to DT schema
      commit: 2a756ac4d98efc97503629fcaddb2e7c46255824
[4/9] dt-bindings: remoteproc: qcom: add IPQ9574 image loader
      commit: bc33b5b5e23a389e660c3d696cd2e043fdf33ef7
[7/9] remoteproc: qcom_q6v5_wcss: support IPQ9574
      commit: 0149254e603f1fd89cb08aec36174ba7c2f198e3
[8/9] remoteproc: qcom_q6v5_wcss: support m3 firmware
      commit: 67804d8274d478ba8d1a84e9437fb340a8d3c26f
[9/9] remoteproc: qcom_q6v5_wcss: use bulk clk API for q6 clocks in QCS404
      commit: 920aa0298197a9a116210ac6057f1e880b9edd99

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
