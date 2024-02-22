Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE7C1468ED
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 Feb 2024 15:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708614739; cv=none; b=jYkxOZw5DOMfGa8M2cYKotIGCqLvnr6nu80wK5nwUWw+Pson8JCL/lLz2gTtKuMB17fNWWjX5nkkdieM8eFNiP5XFhrAcYW86YJ+IlBdn0yNkTpVk54nRsMtqTXMHOP92t7pMIcxGW7AKojc0Ort07ZfkrLNbXe+ZtNtIoKSZ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708614739; c=relaxed/simple;
	bh=hU7ymWtL1JP8bJ0OwXFNvihGAJPlrcM1VZOfiUJkv3Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=FBAc8cMu0JOXQec4Ps4USWx+vnXKAZP0tj6+YaqGDDTR6N373rGQq/NdQu3dc4GvsVBl51WTtAOYLMCYAniA70rmCnmx7ELr/9e8LXKcNLaqN4YFzztsqwt+acbRhCIYxA5u/r4yYf+uSlE1cnmZg930AG25JyExchPAnbTkS5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u24O2y5U; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u24O2y5U"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-564d9b0e96dso3960877a12.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Feb 2024 07:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708614735; x=1709219535; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hU7ymWtL1JP8bJ0OwXFNvihGAJPlrcM1VZOfiUJkv3Q=;
        b=u24O2y5Ulqlhat+seK9ZgfPeRMMVPj2QTxtNQ+ku8P5OZlM0o+ZMCJ6nQpnjSOY9NA
         /j82GSNFZvH0Aj2fyN5oB4tgwg6/WNbkpeHYHG+fcznrn/ikqlwLVSVKvO66rxX5IXRS
         e3XkBdmiwHp/Tis9RNn8KETPH8ox1fNz3u4/2JbNnhF3Q0pk3jAXMdrXsqvyvzA6/m8d
         h13lEM+myKrPd970OJi9lvDRItz9kOXE8m4P9/PJaWNUtA6QMcCfI17L6lsh7Zk/pkA9
         +TyI2pjlowA0HFTx2wJ+B1R4nOU7/K2RczbpLu1NPnzWGnF52GG92invMVxW3D8F/0A1
         5rYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708614735; x=1709219535;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hU7ymWtL1JP8bJ0OwXFNvihGAJPlrcM1VZOfiUJkv3Q=;
        b=YwYZaQ730bpg+/JfIxd28XpjaamDYylI1ZUBhrR3J0Wv2mZKZsqy/atKoOmqi3JUAu
         dBGc5nDqNTFLftSzwJy6aWRkaE+9IZiHpQvHU1CQJigLlgAoF1I7OLrq6g54fRajK+if
         yNjpcQAmp5rBSC2PW83ektntGH/SWSfORreu7qpXESrXLMkU6sK5FY/1VGtsL8OmZlbm
         lOp14+SG3eQRo/Qw/lYmEVagMD7LfEmSYjzpTx5NAuq48IWmvJWz52PhnZHk9CJvgP8k
         JGaDtKVJtFL5C4Nzt1hXk4RZ5Hle0Cys77C0/hvCigsdKMXTbh4FMEg53dZ669/dBjnX
         xnHA==
X-Gm-Message-State: AOJu0YyuYfFVgpHrBfB9AdtHeN2CgZqfzpT2L+2sq0sKpHucH1Q55Whj
	u7tCtHoEke8KF5FXwqXum1j4Yqr8ZVjyfkKM3Mg4GvCYs/KCSgdaHE+TLLXsbo6/JRmg8aY5Yqk
	3YsWLb8B7BGKCazodedaNTHReRz+MQ69txcuEiNGygLGIg8phQO8=
X-Google-Smtp-Source: AGHT+IEOcaShoDVYb6Rr7XAfMaJwaIzHMW2FMOGEzycwI6QM9uiW4ScZjG5MZpmlz3h+lc6ZOfCE5SSFY91hpFSTEqM=
X-Received: by 2002:a05:6402:1257:b0:564:73e9:a9cd with SMTP id
 l23-20020a056402125700b0056473e9a9cdmr9151561edw.31.1708614735480; Thu, 22
 Feb 2024 07:12:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 22 Feb 2024 08:12:04 -0700
Message-ID: <CANLsYkwW+6NmKf8fK=j+-wWL=0jR76iTDJsuZ1DEMJb6aL1ceQ@mail.gmail.com>
Subject: Remoteproc/RPMSG patchset review order for February 22nd 2024
To: linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

[PATCH v3 0/7] Introduction of a remoteproc tee to load signed firmware
Audio dsp recovery using remoteproc
[PATCH v11 0/4] add zynqmp TCM bindings
