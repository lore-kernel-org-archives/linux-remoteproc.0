Date: Mon, 18 Nov 2019 20:39:15 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4] remoteproc: stm32: fix probe error case
Message-ID: <20191119043912.GT3108315@builder>
References: <1573812188-19842-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573812188-19842-1-git-send-email-fabien.dessenne@st.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 15 Nov 02:03 PST 2019, Fabien Dessenne wrote:
> +
> +	return 0;
> +
> +err_probe:
> +	for (j = i - 1; j >= 0; j--)

It's idiomatic to just use 'i' itself here. But I applied this as is,
with Mathieu's t-b.

Thanks,
Bjorn
