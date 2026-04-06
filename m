Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF74D340A6C;
	Mon,  6 Apr 2026 15:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775488209; cv=none; b=uKJsqZ4KDyM7Zf6b5QwkjvC85m+/bgDShHUbhSVRToE+Qu76klNfcjvRitgyu8BRGv5/b5k5e64JvwIjN7z4qGeYzQs8b0itjUQnNHRJxIy4/MtZzOgr8uxwclnxU00hvZavpAe4WLGQnnJKP9GKJfDWazNO+iKs6YAlQ5NzvDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775488209; c=relaxed/simple;
	bh=QCH9/fQXkWqdlXPHFsOvun/ufFnxk8h7xU8O5jmi0gY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jg079o7trke0+ZtgjAEFckWKllJ7BBGOdMni2u9qqhAwrfFisMlBl+0HMk4oAqAhKRsDoosbd6wRJ+kF4JTQF+8gv0OQ8SAJtPDhouw3barZ+8SqPz+4FJWwhrsJKYUjZdLPk5u4pEQrt8x1Nhlz79qlufZeeNnaTwN+WGMGYt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXvMLwyN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXvMLwyN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429DBC4CEF7;
	Mon,  6 Apr 2026 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775488209;
	bh=QCH9/fQXkWqdlXPHFsOvun/ufFnxk8h7xU8O5jmi0gY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fXvMLwyN5aV+27wX2oZvxjG+OrFermo3/KAcCKQj9NEoZfqREiF7RE9FTAcfVBWSr
	 VwOcxvkIoouFqgmvroY6EXu9oHZCpw3RwSYstZaQT7lOaho3lcjGVv513S1xE/CXqC
	 j/mvjH8kVK9z50GT9LYF900C74vZuQIGQ1kmOrOt15NiyNalmYeqZ7kwiE35RG0+bx
	 a20LG1cHPeQmROJdiITJYl94/XBBTvrJb16HpnoI42Ab6lhA1OrGOOg8ZTPayrWhxr
	 ySDwcv6VPxjw1WX76xliGNIVB0VfRBp9Hd0PFRgF98VwaWpFW2U+DHw1OY20qc7ot8
	 jQ4zBM7/maIDg==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] remoteproc: qcom: pas: Add supoport for Eliza ADSP
Date: Mon,  6 Apr 2026 10:09:59 -0500
Message-ID: <177548820158.2290739.11047849605155160318.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327-eliza-remoteproc-adsp-v1-0-1c46c5e5f809@oss.qualcomm.com>
References: <20260327-eliza-remoteproc-adsp-v1-0-1c46c5e5f809@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 27 Mar 2026 18:18:37 +0200, Abel Vesa wrote:
> Add support for ADSP remoteproc found on Qualcomm Eliza SoC.
> The rest of the remoteprocs will come later.
> 
> Instead of adding a dedicated bindings schema, just reuse the Milos one
> as bindings are exactly the same.
> 
> Then, just add the compatible and reuse the SM8550 configuration in the
> driver.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: remoteproc: qcom,milos-pas: Document Eliza ADSP
      commit: 7cf2f07f949c999f8c0349d1fa3f1f0e69854469
[2/2] remoteproc: qcom: pas: Add Eliza ADSP support
      commit: 56c1ec524284805da0181bc6e9ca656c0091b201

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
