Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394CD8C1F;
	Fri, 31 Jul 2026 09:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785490708; cv=none; b=kNh0vhq1k9HErkM9ZSVv9btlKvw6ACYWDNNv+fnVSwZ2H/jy77LTI/DMq1WjDok73zBbL6PCjcaptIOISumj7AoQ8f6Yl68Vh/vXplx8bw81UycwNQpIp99yLrB3YB2sqZdChT1kZ5yofsEGjglcljieTzMNDi+rGqBUPVnKrhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785490708; c=relaxed/simple;
	bh=AMDE6RLrCM66/Hr6Es7Mgknit02lqOplKfs7xLbbI4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXUcfOWhQFODrnFoFhkaPEMZAcixLLMwsru7U8JOdPAUV49csNgIwaqpoLX4fWpYqgHs/7xi16JfitS0H1L9Wtw5puM5HktZ89vq1Zy2EVG3Kgp3wHVyu0nImsDkmfMyiDhZZcWdl2Fwiy52cMNF6fiewmn0jvjC79ux4xXC2EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldGo7bc/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldGo7bc/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92AE1F000E9;
	Fri, 31 Jul 2026 09:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785490706;
	bh=oEv56Jq+LDIkoT/lGm+K1+duopGc5V4H+8YjSUF9M9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ldGo7bc/TTpLI9sS2t3cA33+ewXENIbW9f0tjslayRSE+AI08YJBkYM5VuSMmb85n
	 RxPORc/nU1X4Ih+UL/MHIImf7Zi829VrBfTbI9zsfPY/YmPZ7kmzyk1RwP1p22wxsq
	 5q+JFBlE1Aoq0yOfVx+icq/Rn5/upkunHH9Y7bTM4PTatgvKXdqHKRSPogWvLzOpan
	 rJOz/cLldCvXaFZCPDvcH5XzMSt0O9zsCB5nB3GSOcfgctMSWNXhnYIzMoT5Tbot9V
	 putMeQrQgiEAeTKrO5QCf3LaAsDzzFV/J4XJLOWGh6/PRTp/ssGLsEeEtpx0uQ38ei
	 DxF0GBRhpZKQg==
Date: Fri, 31 Jul 2026 11:38:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@oss.nxp.com>, 
	Francesco Dolcini <francesco@dolcini.it>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] remoteproc: imx_rpoc: fix carveout name parsing
Message-ID: <20260731-sweet-curvy-lion-bf0215@quoll>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
 <20260730163412.1145-3-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730163412.1145-3-laurentiumihalcea111@gmail.com>

On Thu, Jul 30, 2026 at 09:34:10AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The imx remoteproc driver assumes that the names of the reserved memory
> regions reflect their usage (e.g. "vdevbuffer", "vdev0vring0", etc.). This
> conflicts with the devicetree specification's recommendation, which states
> that the names of the devicetree nodes should be generic.

This is not true and I already told you that at v2.

Best regards,
Krzysztof

