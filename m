Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15451E9B34;
	Tue, 13 May 2025 20:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747168942; cv=none; b=i8jJq/mNAac5mIbEMRobOH7+rKRdB7YpK92W8f2lDb7CZBSuQyovsEXNrNr4FGS4TORp+BzBAuo8h1a1O1dTGH1G0wuSif4jDBPYCm3syc2Hj+cIl7O74TIe3hRjJFj0NC715Iuu48urt4k/3bDpuEKiGiotwWgCpku3o5lfo3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747168942; c=relaxed/simple;
	bh=jEpF9ihSqNrPk+Kb/LgpGFisCYE5gfKBufeLSpId8zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NShK/ekLwaVWmxphdpfAQP5DmvM+sJDJe+Se5CXxB51pQ7I/mjwF0sI06QtFKVsowEDxBreRA9I292mGQVnK2zvxP3D4S+J3AtPy1D2aI6riHjCPRoPaTGBI9N1rnukjfkgKqnVbKQJ9Plw1mHsek3ZEXUroLlF8A91Iv1dtHn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzPkkMBy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzPkkMBy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84955C4CEEB;
	Tue, 13 May 2025 20:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747168941;
	bh=jEpF9ihSqNrPk+Kb/LgpGFisCYE5gfKBufeLSpId8zs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fzPkkMByGS/ip2DnX/kypqZQ7eSWFSVFOxF70i8mO2pR1VzQfz6S3Vwi6DrfSyfDw
	 yoUcn8tzOg9PwvDZM3+UIMcf9DCjwU3xUuyg9MccT0Stir8DSFKWwuXBY0IUZSlBC2
	 mYMDUlAD6zjEl/czZ9M4fLnPC1iSk1LuxWgO1rW+pYTNpzyRLcXUGcVp62p+WR81x9
	 AZIBkpPyqjejzmMQ6830qTRxqyUVYgWOPQVZEzCppMrH4qOTZNBHYhVZv/dtiUjc9W
	 WERRp0TbgKOKmFjFQvQz3CSFrccWPsCsqrcAysvJs+xAz0orcENaPdYjai0041oqJs
	 WWKIa3I7ZxUkw==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/3] SC8280XP SLPI
Date: Tue, 13 May 2025 15:42:10 -0500
Message-ID: <174716891497.3696994.10916942446361805328.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 03 May 2025 00:37:58 +0200, Konrad Dybcio wrote:
> SC8280XP features a SLPI, much like its distant relative, SM8350.
> 
> This series adds the bindings and dt node for it (also cleaning up the
> DTSI in meantime)
> 
> 

Applied, thanks!

[1/3] dt-bindings: remoteproc: qcom,sm8350-pas: Add SC8280XP
      commit: 6a4adb7349241c00cefde8c765c1f64382b17563

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
