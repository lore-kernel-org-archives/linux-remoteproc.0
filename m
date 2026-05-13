Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40DA3655F1;
	Wed, 13 May 2026 23:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778714442; cv=none; b=S77x2XaqZc+9ZAPVzWUg7zMQjhyS5yLh++1+zl+CWN5gy1Rs/SYr1fIuhs65wUmCJmylr0Xp++C1i5lJ07j+bQvrEd5hmN52gMEsUF+mz9zkSKdP9dE7g+LAJezuWtDzX3WVinHbcWYfid0x8lXwFI1GwIvAq2zKTuyVF08v0A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778714442; c=relaxed/simple;
	bh=rSvLrYMZaQ1/Qq/EZ3LS+CQkZYr/sql1EhvB64w9ByQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwBQMEj6zzB1DRDC6LSRhd6RIclALsvR8lFimjx/YzPAamxMGLA45vY1IcYjY9i1YlVU+NoqzKOA5bSKxxqzzE0HG3aqcCOEgmUAxstPFrIHE73zJ0EdfYPCV5jrSkgVuAkrOhQIxf088vZvBRUe2fgg7MK8WGa7fXSWEAEdKz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kb0tSt3O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kb0tSt3O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C66C19425;
	Wed, 13 May 2026 23:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778714441;
	bh=rSvLrYMZaQ1/Qq/EZ3LS+CQkZYr/sql1EhvB64w9ByQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kb0tSt3OZ0FL4POeX6XhBWm9xURVc/Iliq6xsOn+lOy9wTLCN7ayrNuaB38v5rpMF
	 FsLO3kdRtxsa3A50hELs1rNcehuIzXqxtd3Q0CzD/moOvjKewqOYdhFDtIIihHOYny
	 lS/dcz5YZxwbfPGDAbAPSVMN/Xfglsj35znhc44yc8o44Mml3A8QvEvmz8SVQ/vaXe
	 1fQ87ipbr6zcZIQNxwLKm9eqNayOpfy2XJeJJTBGCbvEh/TWGf/CAUl88osSBVpX36
	 PRMQ42kb4gCAsnRDFjCCyu/nUMZc1uoNkVlEsNLBw1ldiCH4Jz1HWcCvJjlhIkEh8u
	 Oq7CGxz4IZEEg==
Date: Wed, 13 May 2026 18:20:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	Stephan Gerhold <stephan@gerhold.net>, linux-kernel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: remoteproc: Add Shikra RPM processor
 compatible
Message-ID: <177871443226.2291767.12227722553273027376.robh@kernel.org>
References: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
 <20260508-shikra_mailbox_and_rpm_changes-v3-2-698f8e5fb339@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v3-2-698f8e5fb339@oss.qualcomm.com>


On Fri, 08 May 2026 16:10:47 +0530, Sneh Mankad wrote:
> From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> Add compatible for the Qualcomm Shikra RPM processor.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

