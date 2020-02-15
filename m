Date: Fri, 14 Feb 2020 23:46:44 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: wcnss: Add iris completion barrier
Message-ID: <20200215074641.GS955802@ripper>
References: <1581530043-12112-1-git-send-email-loic.poulain@linaro.org>
 <20200214204627.GA10464@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200214204627.GA10464@xps15>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, anibal.limon@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 14 Feb 12:46 PST 2020, Mathieu Poirier wrote:

> On Wed, Feb 12, 2020 at 06:54:03PM +0100, Loic Poulain wrote:
> > There is no guarantee that the iris pointer will be assigned before
> > remoteproc subsystem starts the wcnss rproc, actually it depends how
> > fast rproc subsystem is able to get the firmware to trigger the start.
> > 
> > This leads to sporadic wifi/bluetooth initialization issue on db410c
> > with the following output:
> >  remoteproc remoteproc1: powering up a204000.wcnss
> >  remoteproc remoteproc1: Booting fw image qcom/msm8916/wcnss.mdt...
> >  qcom-wcnss-pil a204000.wcnss: no iris registered
> >  remoteproc remoteproc1: can't start rproc a204000.wcnss: -22
> > 
> > This patch introduces a 'iris_assigned' completion barrier to fix
> > this issue. Maybe not the most elegant way, but it does the trick.
> > 
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  drivers/remoteproc/qcom_wcnss.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> > index a0468b3..c888282 100644
> > --- a/drivers/remoteproc/qcom_wcnss.c
> > +++ b/drivers/remoteproc/qcom_wcnss.c
> > @@ -84,6 +84,7 @@ struct qcom_wcnss {
> >  
> >  	struct completion start_done;
> >  	struct completion stop_done;
> > +	struct completion iris_assigned;
> >  
> >  	phys_addr_t mem_phys;
> >  	phys_addr_t mem_reloc;
> > @@ -138,6 +139,7 @@ void qcom_wcnss_assign_iris(struct qcom_wcnss *wcnss,
> >  
> >  	wcnss->iris = iris;
> >  	wcnss->use_48mhz_xo = use_48mhz_xo;
> > +	complete(&wcnss->iris_assigned);
> >  
> >  	mutex_unlock(&wcnss->iris_lock);
> >  }
> > @@ -213,6 +215,10 @@ static int wcnss_start(struct rproc *rproc)
> >  	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
> >  	int ret;
> >  
> > +	/* Grant some time for iris registration */
> > +	wait_for_completion_timeout(&wcnss->iris_assigned,
> > +				    msecs_to_jiffies(5000));
> > +
> >  	mutex_lock(&wcnss->iris_lock);
> >  	if (!wcnss->iris) {
> >  		dev_err(wcnss->dev, "no iris registered\n");
> > @@ -494,6 +500,7 @@ static int wcnss_probe(struct platform_device *pdev)
> >  
> >  	init_completion(&wcnss->start_done);
> >  	init_completion(&wcnss->stop_done);
> > +	init_completion(&wcnss->iris_assigned);
> >  
> >  	mutex_init(&wcnss->iris_lock);
> 
> If I understand the problem correctly, if loading the fw image takes long enough,
> qcom_iris_probe() that is triggered by of_platform_populate() has time to
> complete and call qcom_wcnss_assign_iris().  Otherwise the remoteproc core calls
> wcnss_start() before qcom_wcnss_assign_iris() had the opportunity to run.
> 
> If I am correct, would it be possible to call of_platform_populate() before
> calling rproc_add()?  There might be some refactoring to do but that's probably
> better than introducing a delay...
> 

We'll still have the problem that if the iris device probe defer on the
regulators it still might not be in place when we're hitting
wcnss_start().

Unfortunately we need a struct device with the iris of_node associated,
in order get hold of the regulators, but we should be able to drop the
platform_driver and the probing in favor of just making up a struct
device, associating it with the of_node and requesting the iris
regulators using this.

That would remove the whole timing aspect and we can properly probe
defer the qcom_wcnss when the iris regulators are not yet in place.

Regards,
Bjorn
