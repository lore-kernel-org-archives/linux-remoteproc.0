Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 27 May 2016 10:47:03 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 10/18] ASoC: sti: Update DT example to match the
 driver code
Message-ID: <20160527154703.GA21568@rob-hp-laptop>
References: <1464192412-16386-1-git-send-email-peter.griffin@linaro.org>
 <1464192412-16386-12-git-send-email-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1464192412-16386-12-git-send-email-peter.griffin@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, vinod.koul@intel.com, ohad@wizery.com, bjorn.andersson@linaro.org, arnd@arndb.de, lee.jones@linaro.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-remoteproc@vger.kernel.org, arnaud.pouliquen@st.com, broonie@kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, May 25, 2016 at 05:06:44PM +0100, Peter Griffin wrote:
> uniperiph-id, version and mode are ST specific bindings and
> need the 'st,' prefix. Update the examples, as otherwise copying
> them yields a runtime error parsing the DT node.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Cc: arnaud.pouliquen@st.com
> Cc: broonie@kernel.org
> ---
>  .../devicetree/bindings/sound/st,sti-asoc-card.txt   | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
